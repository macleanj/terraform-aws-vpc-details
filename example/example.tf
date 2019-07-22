locals {
  region = "us-east-1"
}

provider "aws" {
  region = "${local.region}"
}

module "vpc_details" {
  source               = "git::https://github.com/macleanj/terraform_aws_vpc_details.git"
  vpc_name             = "my-great-vpc"

  subnet_name_private1 = "${local.region}a"
  subnet_name_private2 = "${local.region}b"

  subnet_name_public1 = "${local.region}a"
  has_nat_gw_public1  = false
  subnet_name_public2 = "${local.region}b"
  has_nat_gw_public2  = false
}
