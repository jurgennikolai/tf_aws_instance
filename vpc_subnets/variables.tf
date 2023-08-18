locals {
  conf = {
    auth = {
        region      = "us-east-1"
        access_key  = "<<access_key>>"
        secret_key  = "<<secret_key>>" 
    }

    vpc = {
        name              = "VPC M01"
        cirds_block       = "10.0.0.0/16"
        instance_tenancy  = "default"
    }

    subnet = {
        public_cirds  = ["10.0.1.0/24", "10.0.2.0/24"]
        private_cirds = ["10.0.4.0/24", "10.0.5.0/24"]
    }
  }
}