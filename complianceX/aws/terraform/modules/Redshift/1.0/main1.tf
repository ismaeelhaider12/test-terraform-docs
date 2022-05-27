resource "aws_redshift_cluster" "default" {
  
  cluster_identifier = var.CLUSTER_IDENTIFIER
  database_name      = var.DATABASE_NAME
  master_username    = var.ADMIN_USER
  master_password    = var.ADMIN_PASSWORD
  node_type          = var.NODE_TYPE
  cluster_type       = var.CLUSTER_TYPE

  vpc_security_group_ids       = var.VPC_SECURITY_GROUPS
  cluster_subnet_group_name    = join("", aws_redshift_subnet_group.default.*.id)
  availability_zone            = var.AVAILABILLITY_ZONE
  preferred_maintenance_window = var.PREFERRED_MAINTENANCE_WINDOW

  cluster_parameter_group_name        = join("", aws_redshift_parameter_group.default.*.id)
  automated_snapshot_retention_period = var.AUTOMATED_SNAPSHOT_RETENTION_PERIOD
  port                                = var.PORT
  cluster_version                     = var.ENGINE_VERSION
  number_of_nodes                     = var.NODES
  publicly_accessible                 = var.PUBLICLY_ACCESSIBLE
  encrypted                           = var.ENCRYPTED
  enhanced_vpc_routing                = var.ENHANCED_VPC_ROUTING
  kms_key_id                          = var.KMS_KEY_ARN
  elastic_ip                          = var.ELASTIC_IP
  skip_final_snapshot                 = var.SKIP_FINAL_SNAPSHOT
  final_snapshot_identifier           = var.FINAL_SNAPSHOT_IDENTIFIER
  snapshot_identifier                 = var.SNAPSHOT_IDENTIFIER
  snapshot_cluster_identifier         = var.SNAPSHOT_CLUSTER_IDENTIFIER
  owner_account                       = var.OWNER_ACCOUNT
  iam_roles                           = var.IAM_ROLES

  depends_on = [
    aws_redshift_subnet_group.default,
    aws_redshift_parameter_group.default
  ]

  logging {
    enable        = var.LOGGING
    bucket_name   = var.LOGGING_BUCKET_NAME
    s3_key_prefix = var.LOGGING_S3_KEY_PREFIX
  }

    tags = merge(
    var.COMMON_TAGS,
    var.TAGS
  )
}

resource "aws_redshift_subnet_group" "default" {

  name        = var.REDSHIFT_SUBNET_GROUP_NAME
  subnet_ids  = var.SUBNET_IDS
  description = "Allowed subnets for Redshift Subnet group"


  tags = merge(
    var.COMMON_TAGS,
    var.TAGS
  )
}

resource "aws_redshift_parameter_group" "default" {

  name   = var.REDSHIFT_PARAMETER_GROUP_NAME
  family = var.PARAMETER_GROUP_FAMILY #"redshift-1.0"

  dynamic "parameter" {
    for_each = var.CLUSTER_PARAMETERS
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  tags = merge(
    var.COMMON_TAGS,
    var.TAGS
  )
}