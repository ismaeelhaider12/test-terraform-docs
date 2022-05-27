locals {
  # convert from list to map with unique keys
  recordsets = { for rs in var.RECORDS : join(" ", compact(["${rs.name} ${rs.type}", lookup(rs, "set_identifier", "")])) => rs }
}

resource "aws_route53_zone" "this" {
  count = var.CREATE_ZONE ? 1 : 0
  name          = var.ZONE_NAME
  comment       = var.DESCRIPTION != "" ? var.DESCRIPTION : null
  force_destroy = var.FORCE_DESTROY
  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,
  )
  dynamic "vpc" {
    for_each = var.VPCS
    content {
      vpc_id     = vpc.value.vpc_id
      vpc_region = lookup(vpc.value, "vpc_region", null)
    }
  }
}

data "aws_route53_zone" "this" {
  count = var.CREATE_RECORD ? 1 : 0
  name         = var.CREATE_ZONE ? aws_route53_zone.this[0].name : var.ZONE_NAME
}

resource "aws_route53_record" "this" {
  for_each = var.CREATE_RECORD ? local.recordsets : tomap({})

  zone_id = data.aws_route53_zone.this[0].zone_id
  name           = each.value.name != "" ? "${each.value.name}.${data.aws_route53_zone.this[0].name}" : data.aws_route53_zone.this[0].name
  type           = each.value.type
  ttl            = lookup(each.value, "ttl", null)
  records        = lookup(each.value, "records", null)
  set_identifier = lookup(each.value, "set_identifier", null)

  dynamic "alias" {
    for_each = length(each.value.alias) == 0 ? [] : [true]
    content {
      name                   = each.value.alias.name
      zone_id                = each.value.alias.zone_id
      evaluate_target_health = lookup(each.value.alias, "evaluate_target_health", false)
    }
  }

  dynamic "weighted_routing_policy" {
    for_each = length(keys(lookup(each.value, "weighted_routing_policy", {}))) == 0 ? [] : [true]

    content {
      weight = each.value.weighted_routing_policy.weight
    }
  }
}
