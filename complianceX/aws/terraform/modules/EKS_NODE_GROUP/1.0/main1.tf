##########################################################
##################################### USER DATA ####
##########################################################
data "template_file" "template_userdata" {
  template = "${file("${path.module}/userdata/join.sh")}"
vars = {
  "CLUSTER_NAME" = "${var.CLUSTER_NAME}"
}
}

data "template_cloudinit_config" "userdata" {
  gzip          = true
  base64_encode = true
  part {
    filename     = "join.sh"
    content_type = "text/x-shellscript"
    content      = "${data.template_file.template_userdata.rendered}"
  }
  part {
    content_type = "text/x-shellscript"
    content      = "var.USER_DATA"
  }
}
##########################################################
##################################### LAUNCH TEMPLATE ####
##########################################################


resource "aws_launch_template" "launch_template" {

  name = "${var.TEMPLATE_NAME}"

  dynamic "block_device_mappings" {
    for_each = var.EBS_BLOCK_DEVICE
    content {
      device_name  = lookup(block_device_mappings.value, "device_name", null)
      no_device    = lookup(block_device_mappings.value, "no_device", false)
      virtual_name = lookup(block_device_mappings.value, "virtual_name", "")

      dynamic "ebs" {
        for_each = [block_device_mappings.value["ebs"]]
        content {
          delete_on_termination = lookup(ebs.value, "delete_on_termination", true)
          encrypted             = true
          iops                  = lookup(ebs.value, "iops", null)
          kms_key_id            = lookup(ebs.value, "kms_key_id", null)
          snapshot_id           = lookup(ebs.value, "snapshot_id", null)
          volume_size           = lookup(ebs.value, "volume_size", 30)
          volume_type           = lookup(ebs.value, "volume_type", "gp2")
        }
      }
    }
  }

  disable_api_termination = var.DISABLE_API_TERMINATION
  ebs_optimized           = var.EBS_OPTIMIZED
  image_id                             = var.IMAGE_ID
  key_name      = var.KEY_NAME
  user_data = "${data.template_cloudinit_config.userdata.rendered}"
  monitoring {
    enabled = var.ENABLE_MONITORING
  }
  network_interfaces {
    description                 = format("%s%s", var.TEMPLATE_NAME, "NetworkInterface")
    device_index                = 0
    associate_public_ip_address = var.ASSOCIATE_PUBLIC_IP_ADDRESS
    delete_on_termination       = true
    security_groups             = var.SECURITY_GROUP_IDS
  }
  tag_specifications {
    resource_type = "volume"
    tags = merge(
      {
        "Name" = format("%s%s", var.TEMPLATE_NAME, "-Volume")
      },
      var.TAGS,
    )
  }
  tag_specifications {
    resource_type = "instance"
    tags = merge(
      {
        "Name" = format("%s%s", var.TEMPLATE_NAME, "-Instance")
      },
      var.COMMON_TAGS,
      var.INSTANCE_TAGS
    )
  }
  tags = merge(
    {
        "Name" = format("%s", var.TEMPLATE_NAME)
    },
     var.TAGS,
  )
  lifecycle {
    create_before_destroy = true
  }

}



################################################################
##################################### Control Plane Logging ####
################################################################

resource "aws_cloudwatch_log_group" "cluster-logs" {
  name = "${var.CLUSTER_NAME}-Log-Group"
  retention_in_days = var.LOGS_RETENTION_IN_DAYS

  tags = {
    Name = "${var.CLUSTER_NAME}-Log-Group"
  }
}
######################################################
##################################### EKS Cluster ####
######################################################

resource "aws_eks_cluster" "eks" {
  count = var.CREATE_CLUSTER ? 1 : 0    

  name     = var.CLUSTER_NAME
  version  = var.KUBERNETES_VERSION
  role_arn = var.CLUSTER_ROLE_ARN
  enabled_cluster_log_types = var.LOGGING_TYPE
 
  encryption_config {
        resources = [ "secrets" ]
        provider {
            key_arn = var.KMS_ARN
        }
    }

  vpc_config {
    security_group_ids = var.SECURITY_GROUP_IDS
    subnet_ids         = var.CLUSTER_SUBNET_IDS
    endpoint_private_access = var.ENDPOINT_PRIVATE_ACCESS
    endpoint_public_access  = var.ENDPOINT_PUBLIC_ACCESS
    public_access_cidrs     = var.PUBLIC_ACCESS_CIDRS
  }

  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,
    {
      "Name" = var.CLUSTER_NAME
    },
  )
}

#########################################################
##################################### EKS Node Group #### 
#########################################################


resource "aws_eks_node_group" "eks-node-group" {

  cluster_name    = var.CLUSTER_NAME
  node_group_name = "${var.CLUSTER_NAME}-node-group"
  node_role_arn   = var.NODE_ROLE_ARN
  subnet_ids      = var.NODE_GROUP_SUBNET_IDS
  ami_type        = var.AMI_TYPE
  capacity_type   = var.CAPACITY_TYPE

  scaling_config {
    desired_size = var.DESIRED_CAPACITY
    max_size     = var.MAX_SIZE
    min_size     = var.MIN_SIZE
  }


    launch_template {
      id      = aws_launch_template.launch_template.id
      version = aws_launch_template.launch_template.latest_version
    }

  instance_types = [
    var.NODE_INSTANCE_TYPE
  ]
  
  depends_on = [
    aws_eks_cluster.eks
  ]
  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,
    {
        "kubernetes.io/cluster/${var.CLUSTER_NAME}" = "owned"
    },
  )

}