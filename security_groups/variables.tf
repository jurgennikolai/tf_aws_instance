locals {
  conf = {
    auth = {
          region      = "us-east-1"
          access_key  = "<<access_key>>"
          secret_key  = "<<secret_key>>" 
    }

    name        = "DevOPS-GCP-2023"
    tag_name    = "DevOpsGroup"
    description = "SSH Access - Enterprise"
    vpc_id      = "<<vpc_id>>"

    dynamic_ingress = [
      {
        from_port   = 22,
        to_port     = 22,
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 80,
        to_port     = 80,
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]

    dynamic_egress = [
      {
        from_port   = 0,
        to_port     = 0,
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
}