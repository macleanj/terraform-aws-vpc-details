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
  region = local.region
}

module "vpc_details" {
  source               = "git::https://github.com/macleanj/terraform_aws_vpc_details.git"
  vpc_name             = "my-great-vpc"

  # Private subnets
  subnet_name_private1 = "${local.region}a"
  subnet_name_private2 = "${local.region}b"

  # Public subnets
  subnet_name_public1 = "${local.region}a"
  has_nat_gw_public1  = false
  subnet_name_public2 = "${local.region}b"
  has_nat_gw_public2  = false

  # Database subnets
  subnet_name_database1 = "${local.region}a"
  subnet_name_database2 = "${local.region}b"

  # Elasticache subnets
  subnet_name_elasticache1 = "${local.region}a"
  subnet_name_elasticache2 = "${local.region}b"

  # Redshift subnets
  subnet_name_redshift1 = "${local.region}a"
  subnet_name_redshift2 = "${local.region}b"
}
```
## Inputs

Example given for subnet 1, however applies up to subnet 4.

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| vpn_name | VPC name - exact match | string | - | yes |
| subnet_name_private1 | Wildcard match of Private subnet (1-6). The subnet name should have the word ```private``` in the name. | string | - | subnet_name_private1 only |
| subnet_name_public1 | Wildcard match of Public subnet (1-6). The subnet name should have the word ```public``` in the name. | string | - | subnet_name_public1 only |
| has_nat_gw_public1 | Public subnet (1-4) has NAT gateway. | boolean | false | no |
| subnet_name_database1 | Wildcard match of Database subnet (1-6). The subnet name should have the word ```db``` in the name. | string | - | no |
| subnet_name_elasticache1 | Wildcard match of Elasticache subnet (1-6). The subnet name should have the word ```elasticache``` in the name. | string | - | no |
| subnet_name_redshift1 | Wildcard match of Redshift subnet (1-6). The subnet name should have the word ```redshift``` in the name. | string | - | no |
> The naming is fully in line with the default [AWS VPC Terraform module](https://github.com/terraform-aws-modules/terraform-aws-vpc)

## Outputs

Example given for subnet 1, however applies up to subnet 6.
 
| Name | Description | Type |
|------|-------------| -----|
| default_network_acl_id | ID of default Network ACL | string |
| default_security_group_id | ID of default Security Group | string |
| private_subnet_count | Number of Private AZs | number |
| private_subnet_ids | IDs of Private AZs | list |
| public_subnet_count | Number of Public AZs | number |
| public_subnet_ids | IDs of Public AZs | list |
| database_subnet_count | Number of Database AZs | number |
| database_subnet_ids | IDs of Database AZs | list |
| elasticache_subnet_count | Number of Elasticache AZs | number |
| elasticache_subnet_ids | IDs of Elasticache AZs | list |
| redshift_subnet_count | Number of Redshift AZs | number |
| redshift_subnet_ids | IDs of Redshift AZs | list |
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
| subnet_database1_id | ID of Database Subnet 1 | string |
| subnet_database1_availability_zone | AZ name of Database Subnet 1 | string |
| subnet_database1_availability_zone_id | AZ id of Database Subnet 1 | string |
| subnet_database1_cidr_block | IPv4 CIDR block of Database Subnet 1 | string |
| subnet_database1_ipv6_cidr_block | IPv6 CIDR block of database Subnet 1 | string |
| subnet_elasticache1_id | ID of Elasticache Subnet 1 | string |
| subnet_elasticache1_availability_zone | AZ name of Elasticache Subnet 1 | string |
| subnet_elasticache1_availability_zone_id | AZ id of Elasticache Subnet 1 | string |
| subnet_elasticache1_cidr_block | IPv4 CIDR block of Elasticache Subnet 1 | string |
| subnet_elasticache1_ipv6_cidr_block | IPv6 CIDR block of Elasticache Subnet 1 | string |
| subnet_redshift1_id | ID of Redshift Subnet 1 | string |
| subnet_redshift1_availability_zone | AZ name of Redshift Subnet 1 | string |
| subnet_redshift1_availability_zone_id | AZ id of Redshift Subnet 1 | string |
| subnet_redshift1_cidr_block | IPv4 CIDR block of Redshift Subnet 1 | string |
| subnet_redshift1_ipv6_cidr_block | IPv6 CIDR block of Redshift Subnet 1 | string |
| vpc_id | ID of the VPC | string |

Known issues
------------

None

Authors
-------

Module managed by [macleanj](https://github.com/macleanj).

License
-------

MIT Licensed. See LICENSE for full details.
