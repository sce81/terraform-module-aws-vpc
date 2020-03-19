variable "env"                      {}
variable "enable_dns_support"       {default = true}
variable "enable_dns_hostnames"     {default = true}
variable "cidr_block"               {}
variable "public_subnet_cidr"       {type = list}
variable "private_subnet_cidr"      {type = list}
variable "availability_zone"        {
                                    type        = list
                                    default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
                                    }
variable "public_subnet_count"      {default = 3}
variable "private_subnet_count"     {default = 3}
variable "nat_gateway_count"        {default = 3}


