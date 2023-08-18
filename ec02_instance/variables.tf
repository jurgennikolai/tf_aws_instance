locals {
  conf = {
    auth = {
        region      = "us-east-1"
        access_key  = "<<access_key>>"
        secret_key  = "<<secret_key>>" 
    }

    instance = {
        tags_name = { 
            Name = "Terraform-Test-01" 
        }
        ami     = "ami-08a52ddb321b32a8c"
        type    = "t2.micro"
    }

    key_pair = {
        name = "<<key_pair_name>>"
    }

    network = {
        security_groups = ["<<security_group_id>>"]
    }

    ebs = {
        device_name = "/dev/xvda"
        volume_size = "10"
        volume_type = "gp2"  
    }

  }
}