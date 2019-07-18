locals {
  region    = "us-east-1"
}

provider "aws" {
  region = "${local.region}"
}

module "vpc_details" {
  source                = "git::https://github.com/macleanj/terraform_aws_vpc_details.git"
  vpc_name = "Beanstalk VPC"
  subnet_name_private1 = "Beanstalk VPC-private-us-east-1a"
  subnet_name_private2 = "Beanstalk VPC-private-us-east-1b"
  subnet_name_private3 = ""
  subnet_name_private4 = ""

  subnet_name_public1  = "Beanstalk VPC-public-us-east-1a"
  subnet_name_public2  = "Beanstalk VPC-public-us-east-1b"
  subnet_name_public3  = ""
  subnet_name_public4  = ""
}