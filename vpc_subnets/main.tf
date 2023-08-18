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

resource "aws_vpc" "new" {
  cidr_block        = local.conf.vpc.cirds_block
  instance_tenancy  = local.conf.vpc.instance_tenancy

  tags = {
    Name = local.conf.vpc.name
  }
}

resource "aws_subnet" "public" {
  count       = length(local.conf.subnet.public_cirds)
  vpc_id      = aws_vpc.new.id
  cidr_block  = local.conf.subnet.public_cirds[count.index]

  tags = {
    Name = "Public Subnet ${count.index+1}"
  }
}

resource "aws_subnet" "private" {
  count       = length(local.conf.subnet.private_cirds)

  vpc_id      = aws_vpc.new.id
  cidr_block  =  local.conf.subnet.private_cirds[count.index]

  tags = {
    Name = "private Subnet ${count.index}"
  }
}

output "out_aws_vpc" {
  value = aws_vpc.new
}

output "out_aws_public_subnets" {
  value = aws_subnet.public
}

output "out_aws_private_subnets" {
  value = aws_subnet.private
}