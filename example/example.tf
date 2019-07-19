locals {
  region = "us-east-1"
}

provider "aws" {
  region = "${local.region}"
}

module "vpc_details" {
  source               = "git::https://github.com/macleanj/terraform_aws_vpc_details.git"
  vpc_name             = "jml-namespace-development-jml-tet-app"
  subnet_name_private1 = "us-east-1a"
  subnet_name_private2 = "us-east-1b"

  subnet_name_public1 = "us-east-1a"
  has_nat_gw_public1  = true
  subnet_name_public2 = "us-east-1b"
  has_nat_gw_public2  = true
}