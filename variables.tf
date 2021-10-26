variable "env"                      {
                                        type = string
                                        description = "Friendly Env value for the VPC and Subnetwork components"
}
variable "name"                     {
                                        type = string
                                        description = "Friendly Name value for the VPC and Subnetwork components"
                                    }
variable "enable_dns_support"       {default = true}
variable "enable_dns_hostnames"     {default = true}
variable "vpc_cidr"                 {}
variable "public_subnet_cidr"       {
                                        type = list
                                        default = []    
                                    }
variable "private_subnet_cidr"      {
                                        type = list
                                        default = []   
                                    }
variable "database_subnet_cidr"     {
                                        type = list
                                        default = []   
                                    }

variable "extra_tags"               {
                                        type = map
                                        default = {}
                                        description = "Placeholder to allow for additional custom tags to be passed into the module from the environment in map format"
                                    }
variable "public_extra_tags"        {
                                        type = map
                                        default = {}
                                        description = "Placeholder to allow for additional custom tags to be passed into the module from the environment in map format"
                                    }
variable "private_extra_tags"       {
                                        type = map
                                        default = {}
                                        description = "Placeholder to allow for additional custom tags to be passed into the module from the environment in map format"
                                    }
variable "database_extra_tags"      {
                                        type = map
                                        default = {}
                                        description = "Placeholder to allow for additional custom tags to be passed into the module from the environment in map format"
                                    }
