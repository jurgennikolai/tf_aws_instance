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

resource "aws_security_group" "new" {
  name = local.conf.name

  tags = {
    Name = local.conf.tag_name
  }

  description = local.conf.description
  vpc_id      = local.conf.vpc_id
  
  dynamic "ingress" {
    for_each = local.conf.dynamic_ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = local.conf.dynamic_egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

}

output "aws_security_group_result" {
  value = aws_security_group.new
}