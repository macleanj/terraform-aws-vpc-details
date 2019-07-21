AWS get VPN details module
===========================================

Features
--------

This module will get detailed information about the VPC components based on ***names***. This enables to fully rely on the names instead of the ID. This module is especially targeted for terraform projects that rely on a certain VPC that is already created.

Result: When the core VPC would need to be recreated, the dependent terraform projects do not have to be altered and can directly be executed with no code change.

Usage
-----
```hcl
locals {
  region = "us-east-1"
}

provider "aws" {
  region = "${local.region}"
}

module "vpc_details" {
  source               = "git::https://github.com/macleanj/terraform_aws_vpc_details.git"
  vpc_name             = "my-great-vpc"
  subnet_name_private1 = "us-east-1a"
  subnet_name_private2 = "us-east-1b"

  subnet_name_public1 = "us-east-1a"
  has_nat_gw_public1  = true
  subnet_name_public2 = "us-east-1b"
  has_nat_gw_public2  = true
}
```
## Inputs

Example given for subnet 1, however applies up to subnet 4.

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| vpn_name | VPC name - exact match | string | - | yes |
| subnet_name_private1 | Wildcard match of Private subnet (1-4). The subnet name should have the word ```private``` in the name. | string | - | subnet_name_private1 only |
| subnet_name_public1 | Wildcard match of Public subnet (1-4). The subnet name should have the word ```public``` in the name. | boolean | - | subnet_name_public1 only |
| has_nat_gw_public1 | Public subnet (1-4) has NAT gateway. | boolean | false | no |


## Outputs

Example given for subnet 1, however applies up to subnet 4.
 
| Name | Description | Type |
|------|-------------| -----|
| subnets_private_count | Number of Private AZs | number |
| subnets_private_ids | IDs of Private AZs | list |
| subnets_public_count | Number of Public AZs | number |
| subnets_public_ids | IDs of Public AZs | list |
| subnet_private1_id | ID of Private Subnet 1 | string |
| subnet_private1_availability_zone | AZ name of Private Subnet 1 | string |
| subnet_private1_availability_zone_id | AZ id of Private Subnet 1 | string |
| subnet_private1_cidr_block | IPv4 CIDR block of Private Subnet 1 | string |
| subnet_private1_ipv6_cidr_block | IPv6 CIDR block of Private Subnet 1 | string |
| subnet_public1_id | ID of Public Subnet 1 | string |
| subnet_public1_availability_zone | AZ name of Public Subnet 1 | string |
| subnet_public1_availability_zone_id | AZ id of Public Subnet 1 | string |
| subnet_public1_cidr_block | IPv4 CIDR block of Public Subnet 1 | string |
| subnet_public1_ipv6_cidr_block | IPv6 CIDR block of Public Subnet 1 | string |
| subnet_public1_nat_gateway_id | ID of NAT gateway of Public Subnet 1 | string |

Known issues
------------

None

Authors
-------

Module managed by [macleanj](https://github.com/macleanj).

License
-------

MIT Licensed. See LICENSE for full details.
