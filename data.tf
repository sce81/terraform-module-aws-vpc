data "aws_availability_zones" "available" {
  state = "available"
}

locals {
    common_tags = {
        Terraform   = "true"
    }
}