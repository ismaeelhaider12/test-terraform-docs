##############
# EC2 Instance
##############
resource "aws_instance" "this_instance" {
  count = var.INSTANCE_COUNT
  ami                    = var.AMI
  instance_type          = var.INSTANCE_TYPE
  user_data              = var.USER_DATA
  subnet_id              = var.SUBNET_ID
  key_name               = var.KEY_NAME
  monitoring             = var.MONITORING
  vpc_security_group_ids = var.EC2_SECURITY_GROUP_IDS
  iam_instance_profile   = var.IAM_INSTANCE_PROFILE
  associate_public_ip_address = var.ASSOCIATE_PUBLIC_IP_ADDRESS
  tenancy                = var.TENANCY


  dynamic "root_block_device" {
    for_each = length(keys(var.ROOT_BLOCK_DEVICE)) == 0 ? [] : [var.ROOT_BLOCK_DEVICE]
    content {
      delete_on_termination = true
      iops                  = lookup(root_block_device.value, "iops", null)
      volume_size           = lookup(root_block_device.value, "volume_size", 30)
      volume_type           = lookup(root_block_device.value, "volume_type", "gp2")
      encrypted             = true
      kms_key_id            = lookup(root_block_device.value, "kms_key_id", null)      
    }
  }

  dynamic "ebs_block_device" {
    for_each = var.EBS_BLOCK_DEVICE
    content {
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", true)
      device_name           = ebs_block_device.value.device_name
      encrypted             = true
      iops                  = lookup(ebs_block_device.value, "iops", null)
      snapshot_id           = lookup(ebs_block_device.value, "snapshot_id", null)
      volume_size           = lookup(ebs_block_device.value, "volume_size", 30)
      volume_type           = lookup(ebs_block_device.value, "volume_type", "gp2")
      kms_key_id            = lookup(ebs_block_device.value, "kms_key_id", null)
    }
  }

  tags = "${merge(var.COMMON_TAGS, var.TAGS, map("Name", var.INSTANCE_COUNT > 1 ? format("%s-%d", var.NAME, count.index+1) : var.NAME))}"
}
