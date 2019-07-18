data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["${var.vpc_name}"]
  }
}

# Get all private subnet ids
data "aws_subnet_ids" "private" {
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*rivate*"
  }
}

# Get all public subnet ids
data "aws_subnet_ids" "public" {
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*ublic*"
  }
}

data "aws_subnet" "private1" {
  count = "${local.nr_of_azs_private >= 1 ? 1 : 0}"

  tags = {
    Name = "${var.subnet_name_private1}"
  }
}


data "aws_subnet" "private2" {
  count  = "${local.nr_of_azs_private >= 2 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "${var.subnet_name_private2}"
  }
}

data "aws_subnet" "private3" {
  count  = "${local.nr_of_azs_private >= 3 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "${var.subnet_name_private3}"
  }
}

data "aws_subnet" "private4" {
  count  = "${local.nr_of_azs_private >= 4 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "${var.subnet_name_private4}"
  }
}

data "aws_subnet" "public1" {
  count  = "${local.nr_of_azs_public >= 1 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "${var.subnet_name_public1}"
  }
}

data "aws_subnet" "public2" {
  count  = "${local.nr_of_azs_public >= 2 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "${var.subnet_name_public2}"
  }
}

data "aws_subnet" "public3" {
  count  = "${local.nr_of_azs_public >= 3 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "${var.subnet_name_public3}"
  }
}

data "aws_subnet" "public4" {
  count  = "${local.nr_of_azs_public >= 4 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "${var.subnet_name_public4}"
  }
}

data "aws_nat_gateway" "public1" {
  count  = "${var.has_nat_gw_public1 == true ? 1 : 0}"
  subnet_id = "${local.subnet_public1_id}"
}
data "aws_nat_gateway" "public2" {
  count  = "${var.has_nat_gw_public2 == true ? 1 : 0}"
  subnet_id = "${local.subnet_public2_id}"
}
data "aws_nat_gateway" "public3" {
  count  = "${var.has_nat_gw_public3 == true ? 1 : 0}"
  subnet_id = "${local.subnet_public3_id}"
}
data "aws_nat_gateway" "public4" {
  count  = "${var.has_nat_gw_public4 == true ? 1 : 0}"
  subnet_id = "${local.subnet_public4_id}"
}

locals {
  nr_of_azs_private = "${length(data.aws_subnet_ids.public.ids)}"
  nr_of_azs_public  = "${length(data.aws_subnet_ids.public.ids)}"

  subnet_private1_id         = "${length(data.aws_subnet.private1.*.id) > 0 ? element(concat(data.aws_subnet.private1.*.id, list("")), 0) : "not-existing"}"
  subnet_private1_availability_zone = "${length(data.aws_subnet.private1.*.availability_zone) > 0 ? element(concat(data.aws_subnet.private1.*.availability_zone, list("")), 0) : "not-existing"}"
  subnet_private1_availability_zone_id = "${length(data.aws_subnet.private1.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.private1.*.availability_zone_id, list("")), 0) : "not-existing"}"
  subnet_private1_cidr_block = "${length(data.aws_subnet.private1.*.cidr_block) > 0 ? element(concat(data.aws_subnet.private1.*.cidr_block, list("")), 0) : "not-existing"}"
  subnet_private1_ipv6_cidr_block = "${length(data.aws_subnet.private1.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.private1.*.ipv6_cidr_block, list("")), 0) : "not-existing"}"
  
  subnet_private2_id         = "${length(data.aws_subnet.private2.*.id) > 0 ? element(concat(data.aws_subnet.private2.*.id, list("")), 0) : "not-existing"}"
  subnet_private2_availability_zone = "${length(data.aws_subnet.private2.*.availability_zone) > 0 ? element(concat(data.aws_subnet.private2.*.availability_zone, list("")), 0) : "not-existing"}"
  subnet_private2_availability_zone_id = "${length(data.aws_subnet.private2.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.private2.*.availability_zone_id, list("")), 0) : "not-existing"}"
  subnet_private2_cidr_block = "${length(data.aws_subnet.private2.*.cidr_block) > 0 ? element(concat(data.aws_subnet.private2.*.cidr_block, list("")), 0) : "not-existing"}"
  subnet_private2_ipv6_cidr_block = "${length(data.aws_subnet.private2.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.private2.*.ipv6_cidr_block, list("")), 0) : "not-existing"}"

  subnet_private3_id         = "${length(data.aws_subnet.private3.*.id) > 0 ? element(concat(data.aws_subnet.private3.*.id, list("")), 0) : "not-existing"}"
  subnet_private3_availability_zone = "${length(data.aws_subnet.private3.*.availability_zone) > 0 ? element(concat(data.aws_subnet.private3.*.availability_zone, list("")), 0) : "not-existing"}"
  subnet_private3_availability_zone_id = "${length(data.aws_subnet.private3.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.private3.*.availability_zone_id, list("")), 0) : "not-existing"}"
  subnet_private3_cidr_block = "${length(data.aws_subnet.private3.*.cidr_block) > 0 ? element(concat(data.aws_subnet.private3.*.cidr_block, list("")), 0) : "not-existing"}"
  subnet_private3_ipv6_cidr_block = "${length(data.aws_subnet.private3.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.private3.*.ipv6_cidr_block, list("")), 0) : "not-existing"}"

  subnet_private4_id         = "${length(data.aws_subnet.private4.*.id) > 0 ? element(concat(data.aws_subnet.private4.*.id, list("")), 0) : "not-existing"}"
  subnet_private4_availability_zone = "${length(data.aws_subnet.private4.*.availability_zone) > 0 ? element(concat(data.aws_subnet.private4.*.availability_zone, list("")), 0) : "not-existing"}"
  subnet_private4_availability_zone_id = "${length(data.aws_subnet.private4.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.private4.*.availability_zone_id, list("")), 0) : "not-existing"}"
  subnet_private4_cidr_block = "${length(data.aws_subnet.private4.*.cidr_block) > 0 ? element(concat(data.aws_subnet.private4.*.cidr_block, list("")), 0) : "not-existing"}"
  subnet_private4_ipv6_cidr_block = "${length(data.aws_subnet.private4.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.private4.*.ipv6_cidr_block, list("")), 0) : "not-existing"}"

  subnet_public1_id         = "${length(data.aws_subnet.public1.*.id) > 0 ? element(concat(data.aws_subnet.public1.*.id, list("")), 0) : "not-existing"}"
  subnet_public1_availability_zone = "${length(data.aws_subnet.public1.*.availability_zone) > 0 ? element(concat(data.aws_subnet.public1.*.availability_zone, list("")), 0) : "not-existing"}"
  subnet_public1_availability_zone_id = "${length(data.aws_subnet.public1.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.public1.*.availability_zone_id, list("")), 0) : "not-existing"}"
  subnet_public1_cidr_block = "${length(data.aws_subnet.public1.*.cidr_block) > 0 ? element(concat(data.aws_subnet.public1.*.cidr_block, list("")), 0) : "not-existing"}"
  subnet_public1_ipv6_cidr_block = "${length(data.aws_subnet.public1.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.public1.*.ipv6_cidr_block, list("")), 0) : "not-existing"}"
  
  subnet_public2_id         = "${length(data.aws_subnet.public2.*.id) > 0 ? element(concat(data.aws_subnet.public2.*.id, list("")), 0) : "not-existing"}"
  subnet_public2_availability_zone = "${length(data.aws_subnet.public2.*.availability_zone) > 0 ? element(concat(data.aws_subnet.public2.*.availability_zone, list("")), 0) : "not-existing"}"
  subnet_public2_availability_zone_id = "${length(data.aws_subnet.public2.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.public2.*.availability_zone_id, list("")), 0) : "not-existing"}"
  subnet_public2_cidr_block = "${length(data.aws_subnet.public2.*.cidr_block) > 0 ? element(concat(data.aws_subnet.public2.*.cidr_block, list("")), 0) : "not-existing"}"
  subnet_public2_ipv6_cidr_block = "${length(data.aws_subnet.public2.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.public2.*.ipv6_cidr_block, list("")), 0) : "not-existing"}"

  subnet_public3_id         = "${length(data.aws_subnet.public3.*.id) > 0 ? element(concat(data.aws_subnet.public3.*.id, list("")), 0) : "not-existing"}"
  subnet_public3_availability_zone = "${length(data.aws_subnet.public3.*.availability_zone) > 0 ? element(concat(data.aws_subnet.public3.*.availability_zone, list("")), 0) : "not-existing"}"
  subnet_public3_availability_zone_id = "${length(data.aws_subnet.public3.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.public3.*.availability_zone_id, list("")), 0) : "not-existing"}"
  subnet_public3_cidr_block = "${length(data.aws_subnet.public3.*.cidr_block) > 0 ? element(concat(data.aws_subnet.public3.*.cidr_block, list("")), 0) : "not-existing"}"
  subnet_public3_ipv6_cidr_block = "${length(data.aws_subnet.public3.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.public3.*.ipv6_cidr_block, list("")), 0) : "not-existing"}"

  subnet_public4_id         = "${length(data.aws_subnet.public4.*.id) > 0 ? element(concat(data.aws_subnet.public4.*.id, list("")), 0) : "not-existing"}"
  subnet_public4_availability_zone = "${length(data.aws_subnet.public4.*.availability_zone) > 0 ? element(concat(data.aws_subnet.public4.*.availability_zone, list("")), 0) : "not-existing"}"
  subnet_public4_availability_zone_id = "${length(data.aws_subnet.public4.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.public4.*.availability_zone_id, list("")), 0) : "not-existing"}"
  subnet_public4_cidr_block = "${length(data.aws_subnet.public4.*.cidr_block) > 0 ? element(concat(data.aws_subnet.public4.*.cidr_block, list("")), 0) : "not-existing"}"
  subnet_public4_ipv6_cidr_block = "${length(data.aws_subnet.public4.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.public4.*.ipv6_cidr_block, list("")), 0) : "not-existing"}"
  
  subnet_public1_nat_gateway_id = "${length(data.aws_nat_gateway.public1.*.id) > 0 ? element(concat(data.aws_nat_gateway.public1.*.id, list("")), 0) : "not-existing"}"
  subnet_public2_nat_gateway_id = "${length(data.aws_nat_gateway.public2.*.id) > 0 ? element(concat(data.aws_nat_gateway.public2.*.id, list("")), 0) : "not-existing"}"
  subnet_public3_nat_gateway_id = "${length(data.aws_nat_gateway.public3.*.id) > 0 ? element(concat(data.aws_nat_gateway.public3.*.id, list("")), 0) : "not-existing"}"
  subnet_public4_nat_gateway_id = "${length(data.aws_nat_gateway.public4.*.id) > 0 ? element(concat(data.aws_nat_gateway.public4.*.id, list("")), 0) : "not-existing"}"
}