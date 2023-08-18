locals {
    created_at = formatdate("DD-MM-YY_hh-mm-ss", timestamp())

    conf = {
        auth = {
            region      = "us-east-1"
            access_key  = "<<access_key>>"
            secret_key  = "<<secret_key>>" 
        }

        algorithm       = "RSA"
        key_pair_name   = "terraform-test-pair2"
    }
}
