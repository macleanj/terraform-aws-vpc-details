
module "vpn_details" {
  source                = "git::https://github.com/macleanj/terraform_aws_vpc_details.git.git"
  vpn_name = "Beanstalk VPC"
  subnet_label_private1 = "Beanstalk VPC-private-us-east-1a"
  subnet_label_private2 = "Beanstalk VPC-private-us-east-1b"
  subnet_label_private3 = ""
  subnet_label_private4 = ""

  subnet_label_public1  = "Beanstalk VPC-public-us-east-1a"
  subnet_label_public2  = "Beanstalk VPC-public-us-east-1b"
  subnet_label_public3  = ""
  subnet_label_public4  = ""
}