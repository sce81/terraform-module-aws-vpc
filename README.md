# terraform-module-aws-vpc
Terraform module for AWS VPC


## Getting Started

This module is intended to create an AWS VPC with up to 3 subnet tiers

Resources
- aws_vpc
- aws_subnet


### Prerequisites

Terraform ~> 1.0.0

### Tested

Terraform ~> 1.0.9
### Installing

This module should be called by a terraform environment configuration via github
```  
      source           = "git@github.com:sce81/terraform-module-aws-vpc.git"
```
or Terraform Cloud
```
      source           = "app.terraform.io/HashiCorp_AWS_Org/aws-vpc/module"
      version          = "1.0.0"
```


##### Usage

    module "aws_vpc" {
        source = "git@github.com:sce81/terraform-module-aws-vpc.git"
        name                    = "primary"
        env                     = var.env
        vpc_cidr                = "10.0.0.0/20"
        public_subnet_cidr      = ["10.0.0.0/24","10.0.1.0/24", "10.0.2.0/24"]
        private_subnet_cidr     = ["10.0.3.0/24","10.0.4.0/24", "10.0.5.0/24"]
        database_subnet_cidr    = ["10.0.6.0/24","10.0.7.0/24", "10.0.8.0/24"]
    }


addional tags can be appended using the following map values

        extra_tags
        public_extra_tags
        private_extra_tags
        database_extra_tags

### Outputs

The following values are outputted

        aws_vpc.main.id
        aws_subnet.public.*.id
        aws_subnet.private.*.id
        aws_subnet.database.*.id
