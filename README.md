# aws-tf-module-vpc
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

This module should be called by a terraform environment configuration
```  
    source  =   "git@github.com:RSCOEN/aws-tf-module-vpc.git"
```

### Usage

This module has a number of mandatory variables it expects to be passed into it.  

```
env
name
vpc_cidr

````
subnets can be configuredn by passing a list of cidrs for each tier. it is recommended the use the same number of cidrs per tier as there are availability zones in the AWS region you are deploying to.

public_subnet_cidr
private_subnet_cidr
database_subnet_cidr
````

addional tags can be appended using the following map

```
extra_tags
public_extra_tags
private_extra_tags
database_extra_tags
```

the remaining variables are configured with sane defaults which can be overwritten by the parent.  


### Outputs

The following values are outputted

- aws_vpc.main.id
- aws_subnet.public.*.id
- aws_subnet.private.*.id
- aws_subnet.database.*.id
