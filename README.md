AWS get VPN details module
===========================================

Features
--------

This module will get detailed information about the VPC components based on ***names***. This enables to fully rely on the names instead of the ID. This module is especially targeted for terraform projects that rely on a certain VPC. When the core VPC would be recreated, the dependent terraform project does not have to be altered (when this module is incorporated).

Usage
-----
subnets > 1 are optional.
```hcl
module "vpc_details | |
  source                = "git::https://github.com/macleanj/terraform_aws_vpc_details.git"
  vpn_name = "Beanstalk VPC"
  subnet_name_private1 = "Beanstalk VPC-private-us-east-1a"
  subnet_name_private2 = "Beanstalk VPC-private-us-east-1b"
  subnet_name_private3 = ""
  subnet_name_private4 = ""

  subnet_name_public1  = "Beanstalk VPC-public-us-east-1a"
  subnet_name_public2  = "Beanstalk VPC-public-us-east-1b"
  subnet_name_public3  = ""
  subnet_name_public4  = ""
}
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| vpn_name | VPC name | string | - | yes |
| subnet_name_private1 | Name of Private subnet 1. The subnet name should have the word ```private``` in the name. | string |  | yes |
| subnet_name_public1 | Name of Public subnet 1. The subnet name should have the word ```public``` in the name. | string |  | yes |
| subnet_name_private* | Name of Private subnet *. The subnet name should have the word ```private``` in the name. | string |  | no |
| subnet_name_public* | Name of Public subnet *. The subnet name should have the word ```public``` in the name. | string |  | no |


## Outputs

| Name | Description |
|------|-------------|
| subnets_private_count | Number of Private AZs |
| subnets_public_count | Number of Public AZs |
| subnet_private1_id | ID of Private Subnet 1 |
| subnet_private1_cidr_block | CIDR block of Private Subnet 1 |
| subnet_private2_id | ID of Private Subnet 2 |
| subnet_private2_cidr_block | CIDR block of Private Subnet 2 |
| subnet_private3_id | ID of Private Subnet 3 |
| subnet_private3_cidr_block | CIDR block of Private Subnet 3 |
| subnet_private4_id | ID of Public Private 4 |
| subnet_private4_cidr_block | CIDR block of Private Subnet 4 |
| subnet_public1_id | ID of Public Subnet 1 |
| subnet_public1_cidr_block | CIDR block of Public Subnet 1 |
| subnet_public2_id | ID of Public Subnet 2 |
| subnet_public2_cidr_block | CIDR block of Public Subnet 2 |
| subnet_public3_id | ID of Public Subnet 3 |
| subnet_public3_cidr_block | CIDR block of Public Subnet 3 |
| subnet_public4_id | ID of Public Subnet 4 |
| subnet_public4_cidr_block | CIDR block of Public Subnet 4 |

Known issues
------------

None

Authors
-------

Module managed by [macleanj](https://github.com/macleanj).

License
-------

MIT Licensed. See LICENSE for full details.
