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

resource "tls_private_key" "new" {
  algorithm = local.conf.algorithm
}

resource "aws_key_pair" "new" {
  key_name =  local.conf.key_pair_name
  public_key = tls_private_key.new.public_key_openssh
}

resource "local_sensitive_file" "create" {
  content  = tls_private_key.new.private_key_pem
  filename = "./aws-key-pairs-${local.created_at}.pem"
}

output "pair" {
  value = aws_key_pair.new
}

