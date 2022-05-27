locals {
  enabled = true

  attributes = concat(
    [
      {
        name = var.RANGE_KEY
        type = var.RANGE_KEY_TYPE
      },
      {
        name = var.HASH_KEY
        type = var.HASH_KEY_TYPE
      }
    ],
    var.DYNAMODB_ATTRIBUTES
  )

  # Remove the first map from the list if no `range_key` is provided
  from_index = length(var.RANGE_KEY) > 0 ? 0 : 1

  attributes_final = slice(local.attributes, local.from_index, length(local.attributes))
}

resource "null_resource" "global_secondary_index_names" {
  count = (local.enabled ? 1 : 0) * length(var.GLOBAL_SECONDARY_INDEX_MAP)

  # Convert the multi-item `global_secondary_index_map` into a simple `map` with just one item `name` since `triggers` does not support `lists` in `maps` (which are used in `non_key_attributes`)
  # See `examples/complete`
  # https://www.terraform.io/docs/providers/aws/r/dynamodb_table.html#non_key_attributes-1
  triggers = {
    "name" = var.GLOBAL_SECONDARY_INDEX_MAP[count.index]["name"]
  }
}

resource "null_resource" "local_secondary_index_names" {
  count = (local.enabled ? 1 : 0) * length(var.LOCAL_SECONDARY_INDEX_MAP)

  # Convert the multi-item `local_secondary_index_map` into a simple `map` with just one item `name` since `triggers` does not support `lists` in `maps` (which are used in `non_key_attributes`)
  # See `examples/complete`
  # https://www.terraform.io/docs/providers/aws/r/dynamodb_table.html#non_key_attributes-1
  triggers = {
    "name" = var.LOCAL_SECONDARY_INDEX_MAP[count.index]["name"]
  }
}



resource "aws_dynamodb_table" "default" {
  
  name             = var.TABLE_NAME
  billing_mode     = var.BILLING_MODE
  read_capacity    = var.BILLING_MODE == "PAY_PER_REQUEST" ? null : var.AUTOSCALE_MIN_READ_CAPACITY
  write_capacity   = var.BILLING_MODE == "PAY_PER_REQUEST" ? null : var.AUTOSCALE_MIN_WRITE_CAPACITY
  hash_key         = var.HASH_KEY
  range_key        = var.RANGE_KEY
  stream_enabled   = length(var.REPLICAS) > 0 ? true : var.ENABLE_STREAMS
  stream_view_type = length(var.REPLICAS) > 0 || var.ENABLE_STREAMS ? var.STREAM_VIEW_TYPE : ""


  server_side_encryption {
    enabled     = var.ENABLE_ENCRYPTION
    kms_key_arn = var.SERVER_SIDE_ENCRYPTION_KMS_KEY_ARN
  }

  point_in_time_recovery {
    enabled = var.ENABLE_POINT_IN_TIME_RECOVERY
  }

  lifecycle {
    ignore_changes = [
      read_capacity,
      write_capacity
    ]
  }

  dynamic "attribute" {
    for_each = local.attributes_final
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }


  dynamic "global_secondary_index" {
    for_each = var.GLOBAL_SECONDARY_INDEX_MAP
    content {
      hash_key           = global_secondary_index.value.hash_key
      name               = global_secondary_index.value.name
      non_key_attributes = lookup(global_secondary_index.value, "non_key_attributes", null)
      projection_type    = global_secondary_index.value.projection_type
      range_key          = lookup(global_secondary_index.value, "range_key", null)
      read_capacity      = lookup(global_secondary_index.value, "read_capacity", null)
      write_capacity     = lookup(global_secondary_index.value, "write_capacity", null)
    }
  }

  dynamic "local_secondary_index" {
    for_each = var.LOCAL_SECONDARY_INDEX_MAP
    content {
      name               = local_secondary_index.value.name
      non_key_attributes = lookup(local_secondary_index.value, "non_key_attributes", null)
      projection_type    = local_secondary_index.value.projection_type
      range_key          = local_secondary_index.value.range_key
    }
  }

  dynamic "replica" {
    for_each = var.REPLICAS
    content {
      region_name = replica.value
    }
  }

  dynamic "ttl" {
    for_each = var.TTL_ENABLED ? [1] : []
    content {
      attribute_name = var.TTL_ATTRIBUTE
      enabled        = var.TTL_ENABLED
    }
  }

   tags = merge(
    var.COMMON_TAGS,
    var.TAGS
  )
}

resource "aws_appautoscaling_target" "read_target" {
  count              = var.TABLE_AUTOSCALING_ENABLED ? 1 : 0

  max_capacity       = var.AUTOSCALE_MAX_READ_CAPACITY
  min_capacity       = var.AUTOSCALE_MIN_READ_CAPACITY
  resource_id        = "table/${aws_dynamodb_table.default.name}"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"
}


resource "aws_appautoscaling_target" "read_target_index" {
  for_each           = var.TABLE_AUTOSCALING_ENABLED ? toset(null_resource.global_secondary_index_names.*.triggers.name) : toset([])
  max_capacity       = coalesce(var.AUTOSCALE_MAX_READ_CAPACITY_INDEX, var.AUTOSCALE_MAX_READ_CAPACITY)
  min_capacity       = coalesce(var.AUTOSCALE_MIN_READ_CAPACITY_INDEX, var.AUTOSCALE_MIN_READ_CAPACITY)
  resource_id        = "table/${aws_dynamodb_table.default.name}/index/${each.key}"
  scalable_dimension = "dynamodb:index:ReadCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "read_policy" {
  count       = var.TABLE_AUTOSCALING_ENABLED ? 1 : 0

  name        = "DynamoDBReadCapacityUtilization:${join("", aws_appautoscaling_target.read_target.*.id)}"
  policy_type = "TargetTrackingScaling"
  resource_id = join("", aws_appautoscaling_target.read_target.*.resource_id)

  scalable_dimension = join("", aws_appautoscaling_target.read_target.*.scalable_dimension)
  service_namespace  = join("", aws_appautoscaling_target.read_target.*.service_namespace)

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }

    target_value = var.AUTOSCALE_READ_TARGET
  }
}


resource "aws_appautoscaling_policy" "read_policy_index" {
  for_each = var.TABLE_AUTOSCALING_ENABLED ? toset(null_resource.global_secondary_index_names.*.triggers.name) : toset([])

  name = "DynamoDBReadCapacityUtilization:${aws_appautoscaling_target.read_target_index[each.key].id}"

  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.read_target_index[each.key].resource_id
  scalable_dimension = aws_appautoscaling_target.read_target_index[each.key].scalable_dimension
  service_namespace  = aws_appautoscaling_target.read_target_index[each.key].service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }

    target_value = coalesce(var.AUTOSCALE_READ_TARGET_INDEX, var.AUTOSCALE_READ_TARGET)
  }
}

resource "aws_appautoscaling_target" "write_target" {
  count              = var.TABLE_AUTOSCALING_ENABLED ? 1 : 0

  max_capacity       = var.AUTOSCALE_MAX_WRITE_CAPACITY
  min_capacity       = var.AUTOSCALE_MIN_WRITE_CAPACITY
  resource_id        = "table/${aws_dynamodb_table.default.name}"
  scalable_dimension = "dynamodb:table:WriteCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_target" "write_target_index" {
  for_each           = var.TABLE_AUTOSCALING_ENABLED ? toset(null_resource.global_secondary_index_names.*.triggers.name) : toset([])
  max_capacity       = coalesce(var.AUTOSCALE_MAX_WRITE_CAPACITY_INDEX, var.AUTOSCALE_MAX_WRITE_CAPACITY)
  min_capacity       = coalesce(var.AUTOSCALE_MIN_WRITE_CAPACITY_INDEX, var.AUTOSCALE_MIN_WRITE_CAPACITY)
  resource_id        = "table/${aws_dynamodb_table.default.name}/index/${each.key}"
  scalable_dimension = "dynamodb:index:WriteCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "write_policy" {
  count       = var.TABLE_AUTOSCALING_ENABLED ? 1 : 0

  name        = "DynamoDBWriteCapacityUtilization:${join("", aws_appautoscaling_target.write_target.*.id)}"
  policy_type = "TargetTrackingScaling"
  resource_id = join("", aws_appautoscaling_target.write_target.*.resource_id)

  scalable_dimension = join("", aws_appautoscaling_target.write_target.*.scalable_dimension)
  service_namespace  = join("", aws_appautoscaling_target.write_target.*.service_namespace)

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }

    target_value = var.AUTOSCALE_WRITE_TARGET

  }
}

resource "aws_appautoscaling_policy" "write_policy_index" {
  for_each = var.TABLE_AUTOSCALING_ENABLED ? toset(null_resource.global_secondary_index_names.*.triggers.name) : toset([])

  name = "DynamoDBWriteCapacityUtilization:${aws_appautoscaling_target.write_target_index[each.key].id}"

  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.write_target_index[each.key].resource_id
  scalable_dimension = aws_appautoscaling_target.write_target_index[each.key].scalable_dimension
  service_namespace  = aws_appautoscaling_target.write_target_index[each.key].service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }

    target_value = coalesce(var.AUTOSCALE_WRITE_TARGET_INDEX, var.AUTOSCALE_WRITE_TARGET)
  }
}