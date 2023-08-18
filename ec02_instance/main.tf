terraform {
  required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
    region      = local.conf.auth.region
    access_key  = local.conf.auth.access_key
    secret_key  = local.conf.auth.secret_key
}

resource "aws_instance" "Terraform-test-02" {
    ami                     = local.conf.instance.ami
    instance_type           = local.conf.instance.type
    key_name                = local.conf.key_pair.name
    vpc_security_group_ids  = local.conf.network.security_groups
    associate_public_ip_address = true

    tags = local.conf.instance.tags_name

    ebs_block_device {
      device_name  = local.conf.ebs.device_name
      volume_size  = local.conf.ebs.volume_size
      volume_type  = local.conf.ebs.volume_type
    }
}

output "instance" {
  value = aws_instance.Terraform-test-02
  description = "All details"
}