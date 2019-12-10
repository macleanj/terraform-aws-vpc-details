locals {
  region = "us-east-1"
}

provider "aws" {
  region = local.region
}

module "vpc_details" {
  source   = "../"
  vpc_name = "VPC shared testing - dev"

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
