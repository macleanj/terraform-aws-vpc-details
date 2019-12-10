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
# Get all database subnet ids
data "aws_subnet_ids" "database" {
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*db*"
  }
}
# Get all elasticache subnet ids
data "aws_subnet_ids" "elasticache" {
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*lasticache*"
  }
}
# Get all redshift subnet ids
data "aws_subnet_ids" "redshift" {
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*edshift*"
  }
}

# Private subnet names
data "aws_subnet" "private1" {
  count  = "${var.subnet_name_private1 != "" && local.private_subnet_count >= 1 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*rivate*${var.subnet_name_private1}*"
  }
}
data "aws_subnet" "private2" {
  count  = "${var.subnet_name_private2 != "" && local.private_subnet_count >= 2 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*rivate*${var.subnet_name_private2}*"
  }
}
data "aws_subnet" "private3" {
  count  = "${var.subnet_name_private3 != "" && local.private_subnet_count >= 3 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*rivate*${var.subnet_name_private3}*"
  }
}
data "aws_subnet" "private4" {
  count  = "${var.subnet_name_private4 != "" && local.private_subnet_count >= 4 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*rivate*${var.subnet_name_private4}*"
  }
}
data "aws_subnet" "private5" {
  count  = "${var.subnet_name_private5 != "" && local.private_subnet_count >= 5 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*rivate*${var.subnet_name_private5}*"
  }
}
data "aws_subnet" "private6" {
  count  = "${var.subnet_name_private6 != "" && local.private_subnet_count >= 6 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*rivate*${var.subnet_name_private6}*"
  }
}

# Public subnet names
data "aws_subnet" "public1" {
  count  = "${var.subnet_name_public1 != "" && local.public_subnet_count >= 1 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*ublic*${var.subnet_name_public1}*"
  }
}
data "aws_subnet" "public2" {
  count  = "${var.subnet_name_public2 != "" && local.public_subnet_count >= 2 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*ublic*${var.subnet_name_public2}*"
  }
}
data "aws_subnet" "public3" {
  count  = "${var.subnet_name_public3 != "" && local.public_subnet_count >= 3 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*ublic*${var.subnet_name_public3}*"
  }
}
data "aws_subnet" "public4" {
  count  = "${var.subnet_name_public4 != "" && local.public_subnet_count >= 4 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*ublic*${var.subnet_name_public4}*"
  }
}
data "aws_subnet" "public5" {
  count  = "${var.subnet_name_public5 != "" && local.public_subnet_count >= 5 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*ublic*${var.subnet_name_public5}*"
  }
}
data "aws_subnet" "public6" {
  count  = "${var.subnet_name_public6 != "" && local.public_subnet_count >= 6 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*ublic*${var.subnet_name_public6}*"
  }
}

data "aws_nat_gateway" "public1" {
  count     = "${var.has_nat_gw_public1 == true ? 1 : 0}"
  subnet_id = "${local.subnet_public1_id}"
}
data "aws_nat_gateway" "public2" {
  count     = "${var.has_nat_gw_public2 == true ? 1 : 0}"
  subnet_id = "${local.subnet_public2_id}"
}
data "aws_nat_gateway" "public3" {
  count     = "${var.has_nat_gw_public3 == true ? 1 : 0}"
  subnet_id = "${local.subnet_public3_id}"
}
data "aws_nat_gateway" "public4" {
  count     = "${var.has_nat_gw_public4 == true ? 1 : 0}"
  subnet_id = "${local.subnet_public4_id}"
}
data "aws_nat_gateway" "public5" {
  count     = "${var.has_nat_gw_public5 == true ? 1 : 0}"
  subnet_id = "${local.subnet_public5_id}"
}
data "aws_nat_gateway" "public6" {
  count     = "${var.has_nat_gw_public6 == true ? 1 : 0}"
  subnet_id = "${local.subnet_public6_id}"
}

data "aws_network_acls" "default" {
  count  = 1
  vpc_id = "${data.aws_vpc.selected.id}"

  filter {
    name   = "default"
    values = ["true"]
  }
}
data "aws_security_groups" "default" {
  count = 1

  filter {
    name   = "group-name"
    values = ["default"]
  }
  filter {
    name   = "vpc-id"
    values = ["${data.aws_vpc.selected.id}"]
  }
}

# Database subnet names
data "aws_subnet" "database1" {
  count  = "${var.subnet_name_database1 != "" && local.database_subnet_count >= 1 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*db*${var.subnet_name_database1}*"
  }
}
data "aws_subnet" "database2" {
  count  = "${var.subnet_name_database2 != "" && local.database_subnet_count >= 2 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*db*${var.subnet_name_database2}*"
  }
}
data "aws_subnet" "database3" {
  count  = "${var.subnet_name_database3 != "" && local.database_subnet_count >= 3 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*db*${var.subnet_name_database3}*"
  }
}
data "aws_subnet" "database4" {
  count  = "${var.subnet_name_database4 != "" && local.database_subnet_count >= 4 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*db*${var.subnet_name_database4}*"
  }
}
data "aws_subnet" "database5" {
  count  = "${var.subnet_name_database5 != "" && local.database_subnet_count >= 5 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*db*${var.subnet_name_database5}*"
  }
}
data "aws_subnet" "database6" {
  count  = "${var.subnet_name_database6 != "" && local.database_subnet_count >= 6 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*db*${var.subnet_name_database6}*"
  }
}

# Elasticache subnet names
data "aws_subnet" "elasticache1" {
  count  = "${var.subnet_name_elasticache1 != "" && local.elasticache_subnet_count >= 1 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*lasticache*${var.subnet_name_elasticache1}*"
  }
}
data "aws_subnet" "elasticache2" {
  count  = "${var.subnet_name_elasticache2 != "" && local.elasticache_subnet_count >= 2 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*lasticache*${var.subnet_name_elasticache2}*"
  }
}
data "aws_subnet" "elasticache3" {
  count  = "${var.subnet_name_elasticache3 != "" && local.elasticache_subnet_count >= 3 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*lasticache*${var.subnet_name_elasticache3}*"
  }
}
data "aws_subnet" "elasticache4" {
  count  = "${var.subnet_name_elasticache4 != "" && local.elasticache_subnet_count >= 4 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*lasticache*${var.subnet_name_elasticache4}*"
  }
}
data "aws_subnet" "elasticache5" {
  count  = "${var.subnet_name_elasticache5 != "" && local.elasticache_subnet_count >= 5 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*lasticache*${var.subnet_name_elasticache5}*"
  }
}
data "aws_subnet" "elasticache6" {
  count  = "${var.subnet_name_elasticache6 != "" && local.elasticache_subnet_count >= 6 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*lasticache*${var.subnet_name_elasticache6}*"
  }
}

# Redshift subnet names
data "aws_subnet" "redshift1" {
  count  = "${var.subnet_name_redshift1 != "" && local.redshift_subnet_count >= 1 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*edshift*${var.subnet_name_redshift1}*"
  }
}
data "aws_subnet" "redshift2" {
  count  = "${var.subnet_name_redshift2 != "" && local.redshift_subnet_count >= 2 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*edshift*${var.subnet_name_redshift2}*"
  }
}
data "aws_subnet" "redshift3" {
  count  = "${var.subnet_name_redshift3 != "" && local.redshift_subnet_count >= 3 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*edshift*${var.subnet_name_redshift3}*"
  }
}
data "aws_subnet" "redshift4" {
  count  = "${var.subnet_name_redshift4 != "" && local.redshift_subnet_count >= 4 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*edshift*${var.subnet_name_redshift4}*"
  }
}
data "aws_subnet" "redshift5" {
  count  = "${var.subnet_name_redshift5 != "" && local.redshift_subnet_count >= 5 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*edshift*${var.subnet_name_redshift5}*"
  }
}
data "aws_subnet" "redshift6" {
  count  = "${var.subnet_name_redshift6 != "" && local.redshift_subnet_count >= 6 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*edshift*${var.subnet_name_redshift6}*"
  }
}

locals {
  # General
  private_subnet_count     = "${length(data.aws_subnet_ids.private.ids)}"
  private_subnet_ids       = "${data.aws_subnet_ids.private.ids}"
  public_subnet_count      = "${length(data.aws_subnet_ids.public.ids)}"
  public_subnet_ids        = "${data.aws_subnet_ids.public.ids}"
  database_subnet_count    = "${length(data.aws_subnet_ids.database.ids)}"
  database_subnet_ids      = "${data.aws_subnet_ids.database.ids}"
  elasticache_subnet_count = "${length(data.aws_subnet_ids.elasticache.ids)}"
  elasticache_subnet_ids   = "${data.aws_subnet_ids.elasticache.ids}"
  redshift_subnet_count    = "${length(data.aws_subnet_ids.redshift.ids)}"
  redshift_subnet_ids      = "${data.aws_subnet_ids.redshift.ids}"

  # Private subnet information
  subnet_private1_id                   = "${length(data.aws_subnet.private1.*.id) > 0 ? element(concat(data.aws_subnet.private1.*.id, list("")), 0) : null}"
  subnet_private1_availability_zone    = "${length(data.aws_subnet.private1.*.availability_zone) > 0 ? element(concat(data.aws_subnet.private1.*.availability_zone, list("")), 0) : null}"
  subnet_private1_availability_zone_id = "${length(data.aws_subnet.private1.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.private1.*.availability_zone_id, list("")), 0) : null}"
  subnet_private1_cidr_block           = "${length(data.aws_subnet.private1.*.cidr_block) > 0 ? element(concat(data.aws_subnet.private1.*.cidr_block, list("")), 0) : null}"
  subnet_private1_ipv6_cidr_block      = "${length(data.aws_subnet.private1.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.private1.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_private2_id                   = "${length(data.aws_subnet.private2.*.id) > 0 ? element(concat(data.aws_subnet.private2.*.id, list("")), 0) : null}"
  subnet_private2_availability_zone    = "${length(data.aws_subnet.private2.*.availability_zone) > 0 ? element(concat(data.aws_subnet.private2.*.availability_zone, list("")), 0) : null}"
  subnet_private2_availability_zone_id = "${length(data.aws_subnet.private2.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.private2.*.availability_zone_id, list("")), 0) : null}"
  subnet_private2_cidr_block           = "${length(data.aws_subnet.private2.*.cidr_block) > 0 ? element(concat(data.aws_subnet.private2.*.cidr_block, list("")), 0) : null}"
  subnet_private2_ipv6_cidr_block      = "${length(data.aws_subnet.private2.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.private2.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_private3_id                   = "${length(data.aws_subnet.private3.*.id) > 0 ? element(concat(data.aws_subnet.private3.*.id, list("")), 0) : null}"
  subnet_private3_availability_zone    = "${length(data.aws_subnet.private3.*.availability_zone) > 0 ? element(concat(data.aws_subnet.private3.*.availability_zone, list("")), 0) : null}"
  subnet_private3_availability_zone_id = "${length(data.aws_subnet.private3.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.private3.*.availability_zone_id, list("")), 0) : null}"
  subnet_private3_cidr_block           = "${length(data.aws_subnet.private3.*.cidr_block) > 0 ? element(concat(data.aws_subnet.private3.*.cidr_block, list("")), 0) : null}"
  subnet_private3_ipv6_cidr_block      = "${length(data.aws_subnet.private3.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.private3.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_private4_id                   = "${length(data.aws_subnet.private4.*.id) > 0 ? element(concat(data.aws_subnet.private4.*.id, list("")), 0) : null}"
  subnet_private4_availability_zone    = "${length(data.aws_subnet.private4.*.availability_zone) > 0 ? element(concat(data.aws_subnet.private4.*.availability_zone, list("")), 0) : null}"
  subnet_private4_availability_zone_id = "${length(data.aws_subnet.private4.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.private4.*.availability_zone_id, list("")), 0) : null}"
  subnet_private4_cidr_block           = "${length(data.aws_subnet.private4.*.cidr_block) > 0 ? element(concat(data.aws_subnet.private4.*.cidr_block, list("")), 0) : null}"
  subnet_private4_ipv6_cidr_block      = "${length(data.aws_subnet.private4.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.private4.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_private5_id                   = "${length(data.aws_subnet.private5.*.id) > 0 ? element(concat(data.aws_subnet.private5.*.id, list("")), 0) : null}"
  subnet_private5_availability_zone    = "${length(data.aws_subnet.private5.*.availability_zone) > 0 ? element(concat(data.aws_subnet.private5.*.availability_zone, list("")), 0) : null}"
  subnet_private5_availability_zone_id = "${length(data.aws_subnet.private5.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.private5.*.availability_zone_id, list("")), 0) : null}"
  subnet_private5_cidr_block           = "${length(data.aws_subnet.private5.*.cidr_block) > 0 ? element(concat(data.aws_subnet.private5.*.cidr_block, list("")), 0) : null}"
  subnet_private5_ipv6_cidr_block      = "${length(data.aws_subnet.private5.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.private5.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_private6_id                   = "${length(data.aws_subnet.private6.*.id) > 0 ? element(concat(data.aws_subnet.private6.*.id, list("")), 0) : null}"
  subnet_private6_availability_zone    = "${length(data.aws_subnet.private6.*.availability_zone) > 0 ? element(concat(data.aws_subnet.private6.*.availability_zone, list("")), 0) : null}"
  subnet_private6_availability_zone_id = "${length(data.aws_subnet.private6.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.private6.*.availability_zone_id, list("")), 0) : null}"
  subnet_private6_cidr_block           = "${length(data.aws_subnet.private6.*.cidr_block) > 0 ? element(concat(data.aws_subnet.private6.*.cidr_block, list("")), 0) : null}"
  subnet_private6_ipv6_cidr_block      = "${length(data.aws_subnet.private6.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.private6.*.ipv6_cidr_block, list("")), 0) : null}"

  # Public subnet information
  subnet_public1_id                   = "${length(data.aws_subnet.public1.*.id) > 0 ? element(concat(data.aws_subnet.public1.*.id, list("")), 0) : null}"
  subnet_public1_availability_zone    = "${length(data.aws_subnet.public1.*.availability_zone) > 0 ? element(concat(data.aws_subnet.public1.*.availability_zone, list("")), 0) : null}"
  subnet_public1_availability_zone_id = "${length(data.aws_subnet.public1.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.public1.*.availability_zone_id, list("")), 0) : null}"
  subnet_public1_cidr_block           = "${length(data.aws_subnet.public1.*.cidr_block) > 0 ? element(concat(data.aws_subnet.public1.*.cidr_block, list("")), 0) : null}"
  subnet_public1_ipv6_cidr_block      = "${length(data.aws_subnet.public1.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.public1.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_public2_id                   = "${length(data.aws_subnet.public2.*.id) > 0 ? element(concat(data.aws_subnet.public2.*.id, list("")), 0) : null}"
  subnet_public2_availability_zone    = "${length(data.aws_subnet.public2.*.availability_zone) > 0 ? element(concat(data.aws_subnet.public2.*.availability_zone, list("")), 0) : null}"
  subnet_public2_availability_zone_id = "${length(data.aws_subnet.public2.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.public2.*.availability_zone_id, list("")), 0) : null}"
  subnet_public2_cidr_block           = "${length(data.aws_subnet.public2.*.cidr_block) > 0 ? element(concat(data.aws_subnet.public2.*.cidr_block, list("")), 0) : null}"
  subnet_public2_ipv6_cidr_block      = "${length(data.aws_subnet.public2.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.public2.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_public3_id                   = "${length(data.aws_subnet.public3.*.id) > 0 ? element(concat(data.aws_subnet.public3.*.id, list("")), 0) : null}"
  subnet_public3_availability_zone    = "${length(data.aws_subnet.public3.*.availability_zone) > 0 ? element(concat(data.aws_subnet.public3.*.availability_zone, list("")), 0) : null}"
  subnet_public3_availability_zone_id = "${length(data.aws_subnet.public3.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.public3.*.availability_zone_id, list("")), 0) : null}"
  subnet_public3_cidr_block           = "${length(data.aws_subnet.public3.*.cidr_block) > 0 ? element(concat(data.aws_subnet.public3.*.cidr_block, list("")), 0) : null}"
  subnet_public3_ipv6_cidr_block      = "${length(data.aws_subnet.public3.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.public3.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_public4_id                   = "${length(data.aws_subnet.public4.*.id) > 0 ? element(concat(data.aws_subnet.public4.*.id, list("")), 0) : null}"
  subnet_public4_availability_zone    = "${length(data.aws_subnet.public4.*.availability_zone) > 0 ? element(concat(data.aws_subnet.public4.*.availability_zone, list("")), 0) : null}"
  subnet_public4_availability_zone_id = "${length(data.aws_subnet.public4.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.public4.*.availability_zone_id, list("")), 0) : null}"
  subnet_public4_cidr_block           = "${length(data.aws_subnet.public4.*.cidr_block) > 0 ? element(concat(data.aws_subnet.public4.*.cidr_block, list("")), 0) : null}"
  subnet_public4_ipv6_cidr_block      = "${length(data.aws_subnet.public4.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.public4.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_public5_id                   = "${length(data.aws_subnet.public5.*.id) > 0 ? element(concat(data.aws_subnet.public5.*.id, list("")), 0) : null}"
  subnet_public5_availability_zone    = "${length(data.aws_subnet.public5.*.availability_zone) > 0 ? element(concat(data.aws_subnet.public5.*.availability_zone, list("")), 0) : null}"
  subnet_public5_availability_zone_id = "${length(data.aws_subnet.public5.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.public5.*.availability_zone_id, list("")), 0) : null}"
  subnet_public5_cidr_block           = "${length(data.aws_subnet.public5.*.cidr_block) > 0 ? element(concat(data.aws_subnet.public5.*.cidr_block, list("")), 0) : null}"
  subnet_public5_ipv6_cidr_block      = "${length(data.aws_subnet.public5.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.public5.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_public6_id                   = "${length(data.aws_subnet.public6.*.id) > 0 ? element(concat(data.aws_subnet.public6.*.id, list("")), 0) : null}"
  subnet_public6_availability_zone    = "${length(data.aws_subnet.public6.*.availability_zone) > 0 ? element(concat(data.aws_subnet.public6.*.availability_zone, list("")), 0) : null}"
  subnet_public6_availability_zone_id = "${length(data.aws_subnet.public6.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.public6.*.availability_zone_id, list("")), 0) : null}"
  subnet_public6_cidr_block           = "${length(data.aws_subnet.public6.*.cidr_block) > 0 ? element(concat(data.aws_subnet.public6.*.cidr_block, list("")), 0) : null}"
  subnet_public6_ipv6_cidr_block      = "${length(data.aws_subnet.public6.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.public6.*.ipv6_cidr_block, list("")), 0) : null}"

  # Public NAT gateways  
  subnet_public1_nat_gateway_id = "${length(data.aws_nat_gateway.public1.*.id) > 0 ? element(concat(data.aws_nat_gateway.public1.*.id, list("")), 0) : null}"
  subnet_public2_nat_gateway_id = "${length(data.aws_nat_gateway.public2.*.id) > 0 ? element(concat(data.aws_nat_gateway.public2.*.id, list("")), 0) : null}"
  subnet_public3_nat_gateway_id = "${length(data.aws_nat_gateway.public3.*.id) > 0 ? element(concat(data.aws_nat_gateway.public3.*.id, list("")), 0) : null}"
  subnet_public4_nat_gateway_id = "${length(data.aws_nat_gateway.public4.*.id) > 0 ? element(concat(data.aws_nat_gateway.public4.*.id, list("")), 0) : null}"
  subnet_public5_nat_gateway_id = "${length(data.aws_nat_gateway.public5.*.id) > 0 ? element(concat(data.aws_nat_gateway.public5.*.id, list("")), 0) : null}"
  subnet_public6_nat_gateway_id = "${length(data.aws_nat_gateway.public6.*.id) > 0 ? element(concat(data.aws_nat_gateway.public6.*.id, list("")), 0) : null}"

  # Public Default VPC resources
  default_network_acl_id    = "${element(concat(sort(data.aws_network_acls.default.*.ids[0]), sort(list(""))), 0)}"
  default_security_group_id = "${length(data.aws_security_groups.default.*.ids[0]) > 0 ? element(concat(data.aws_security_groups.default.*.ids[0], list("")), 0) : null}"

  # Database subnet information
  subnet_database1_id                   = "${length(data.aws_subnet.database1.*.id) > 0 ? element(concat(data.aws_subnet.database1.*.id, list("")), 0) : null}"
  subnet_database1_availability_zone    = "${length(data.aws_subnet.database1.*.availability_zone) > 0 ? element(concat(data.aws_subnet.database1.*.availability_zone, list("")), 0) : null}"
  subnet_database1_availability_zone_id = "${length(data.aws_subnet.database1.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.database1.*.availability_zone_id, list("")), 0) : null}"
  subnet_database1_cidr_block           = "${length(data.aws_subnet.database1.*.cidr_block) > 0 ? element(concat(data.aws_subnet.database1.*.cidr_block, list("")), 0) : null}"
  subnet_database1_ipv6_cidr_block      = "${length(data.aws_subnet.database1.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.database1.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_database2_id                   = "${length(data.aws_subnet.database2.*.id) > 0 ? element(concat(data.aws_subnet.database2.*.id, list("")), 0) : null}"
  subnet_database2_availability_zone    = "${length(data.aws_subnet.database2.*.availability_zone) > 0 ? element(concat(data.aws_subnet.database2.*.availability_zone, list("")), 0) : null}"
  subnet_database2_availability_zone_id = "${length(data.aws_subnet.database2.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.database2.*.availability_zone_id, list("")), 0) : null}"
  subnet_database2_cidr_block           = "${length(data.aws_subnet.database2.*.cidr_block) > 0 ? element(concat(data.aws_subnet.database2.*.cidr_block, list("")), 0) : null}"
  subnet_database2_ipv6_cidr_block      = "${length(data.aws_subnet.database2.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.database2.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_database3_id                   = "${length(data.aws_subnet.database3.*.id) > 0 ? element(concat(data.aws_subnet.database3.*.id, list("")), 0) : null}"
  subnet_database3_availability_zone    = "${length(data.aws_subnet.database3.*.availability_zone) > 0 ? element(concat(data.aws_subnet.database3.*.availability_zone, list("")), 0) : null}"
  subnet_database3_availability_zone_id = "${length(data.aws_subnet.database3.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.database3.*.availability_zone_id, list("")), 0) : null}"
  subnet_database3_cidr_block           = "${length(data.aws_subnet.database3.*.cidr_block) > 0 ? element(concat(data.aws_subnet.database3.*.cidr_block, list("")), 0) : null}"
  subnet_database3_ipv6_cidr_block      = "${length(data.aws_subnet.database3.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.database3.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_database4_id                   = "${length(data.aws_subnet.database4.*.id) > 0 ? element(concat(data.aws_subnet.database4.*.id, list("")), 0) : null}"
  subnet_database4_availability_zone    = "${length(data.aws_subnet.database4.*.availability_zone) > 0 ? element(concat(data.aws_subnet.database4.*.availability_zone, list("")), 0) : null}"
  subnet_database4_availability_zone_id = "${length(data.aws_subnet.database4.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.database4.*.availability_zone_id, list("")), 0) : null}"
  subnet_database4_cidr_block           = "${length(data.aws_subnet.database4.*.cidr_block) > 0 ? element(concat(data.aws_subnet.database4.*.cidr_block, list("")), 0) : null}"
  subnet_database4_ipv6_cidr_block      = "${length(data.aws_subnet.database4.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.database4.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_database5_id                   = "${length(data.aws_subnet.database5.*.id) > 0 ? element(concat(data.aws_subnet.database5.*.id, list("")), 0) : null}"
  subnet_database5_availability_zone    = "${length(data.aws_subnet.database5.*.availability_zone) > 0 ? element(concat(data.aws_subnet.database5.*.availability_zone, list("")), 0) : null}"
  subnet_database5_availability_zone_id = "${length(data.aws_subnet.database5.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.database5.*.availability_zone_id, list("")), 0) : null}"
  subnet_database5_cidr_block           = "${length(data.aws_subnet.database5.*.cidr_block) > 0 ? element(concat(data.aws_subnet.database5.*.cidr_block, list("")), 0) : null}"
  subnet_database5_ipv6_cidr_block      = "${length(data.aws_subnet.database5.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.database5.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_database6_id                   = "${length(data.aws_subnet.database6.*.id) > 0 ? element(concat(data.aws_subnet.database6.*.id, list("")), 0) : null}"
  subnet_database6_availability_zone    = "${length(data.aws_subnet.database6.*.availability_zone) > 0 ? element(concat(data.aws_subnet.database6.*.availability_zone, list("")), 0) : null}"
  subnet_database6_availability_zone_id = "${length(data.aws_subnet.database6.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.database6.*.availability_zone_id, list("")), 0) : null}"
  subnet_database6_cidr_block           = "${length(data.aws_subnet.database6.*.cidr_block) > 0 ? element(concat(data.aws_subnet.database6.*.cidr_block, list("")), 0) : null}"
  subnet_database6_ipv6_cidr_block      = "${length(data.aws_subnet.database6.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.database6.*.ipv6_cidr_block, list("")), 0) : null}"

  # Elasticache subnet information
  subnet_elasticache1_id                   = "${length(data.aws_subnet.elasticache1.*.id) > 0 ? element(concat(data.aws_subnet.elasticache1.*.id, list("")), 0) : null}"
  subnet_elasticache1_availability_zone    = "${length(data.aws_subnet.elasticache1.*.availability_zone) > 0 ? element(concat(data.aws_subnet.elasticache1.*.availability_zone, list("")), 0) : null}"
  subnet_elasticache1_availability_zone_id = "${length(data.aws_subnet.elasticache1.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.elasticache1.*.availability_zone_id, list("")), 0) : null}"
  subnet_elasticache1_cidr_block           = "${length(data.aws_subnet.elasticache1.*.cidr_block) > 0 ? element(concat(data.aws_subnet.elasticache1.*.cidr_block, list("")), 0) : null}"
  subnet_elasticache1_ipv6_cidr_block      = "${length(data.aws_subnet.elasticache1.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.elasticache1.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_elasticache2_id                   = "${length(data.aws_subnet.elasticache2.*.id) > 0 ? element(concat(data.aws_subnet.elasticache2.*.id, list("")), 0) : null}"
  subnet_elasticache2_availability_zone    = "${length(data.aws_subnet.elasticache2.*.availability_zone) > 0 ? element(concat(data.aws_subnet.elasticache2.*.availability_zone, list("")), 0) : null}"
  subnet_elasticache2_availability_zone_id = "${length(data.aws_subnet.elasticache2.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.elasticache2.*.availability_zone_id, list("")), 0) : null}"
  subnet_elasticache2_cidr_block           = "${length(data.aws_subnet.elasticache2.*.cidr_block) > 0 ? element(concat(data.aws_subnet.elasticache2.*.cidr_block, list("")), 0) : null}"
  subnet_elasticache2_ipv6_cidr_block      = "${length(data.aws_subnet.elasticache2.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.elasticache2.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_elasticache3_id                   = "${length(data.aws_subnet.elasticache3.*.id) > 0 ? element(concat(data.aws_subnet.elasticache3.*.id, list("")), 0) : null}"
  subnet_elasticache3_availability_zone    = "${length(data.aws_subnet.elasticache3.*.availability_zone) > 0 ? element(concat(data.aws_subnet.elasticache3.*.availability_zone, list("")), 0) : null}"
  subnet_elasticache3_availability_zone_id = "${length(data.aws_subnet.elasticache3.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.elasticache3.*.availability_zone_id, list("")), 0) : null}"
  subnet_elasticache3_cidr_block           = "${length(data.aws_subnet.elasticache3.*.cidr_block) > 0 ? element(concat(data.aws_subnet.elasticache3.*.cidr_block, list("")), 0) : null}"
  subnet_elasticache3_ipv6_cidr_block      = "${length(data.aws_subnet.elasticache3.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.elasticache3.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_elasticache4_id                   = "${length(data.aws_subnet.elasticache4.*.id) > 0 ? element(concat(data.aws_subnet.elasticache4.*.id, list("")), 0) : null}"
  subnet_elasticache4_availability_zone    = "${length(data.aws_subnet.elasticache4.*.availability_zone) > 0 ? element(concat(data.aws_subnet.elasticache4.*.availability_zone, list("")), 0) : null}"
  subnet_elasticache4_availability_zone_id = "${length(data.aws_subnet.elasticache4.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.elasticache4.*.availability_zone_id, list("")), 0) : null}"
  subnet_elasticache4_cidr_block           = "${length(data.aws_subnet.elasticache4.*.cidr_block) > 0 ? element(concat(data.aws_subnet.elasticache4.*.cidr_block, list("")), 0) : null}"
  subnet_elasticache4_ipv6_cidr_block      = "${length(data.aws_subnet.elasticache4.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.elasticache4.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_elasticache5_id                   = "${length(data.aws_subnet.elasticache5.*.id) > 0 ? element(concat(data.aws_subnet.elasticache5.*.id, list("")), 0) : null}"
  subnet_elasticache5_availability_zone    = "${length(data.aws_subnet.elasticache5.*.availability_zone) > 0 ? element(concat(data.aws_subnet.elasticache5.*.availability_zone, list("")), 0) : null}"
  subnet_elasticache5_availability_zone_id = "${length(data.aws_subnet.elasticache5.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.elasticache5.*.availability_zone_id, list("")), 0) : null}"
  subnet_elasticache5_cidr_block           = "${length(data.aws_subnet.elasticache5.*.cidr_block) > 0 ? element(concat(data.aws_subnet.elasticache5.*.cidr_block, list("")), 0) : null}"
  subnet_elasticache5_ipv6_cidr_block      = "${length(data.aws_subnet.elasticache5.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.elasticache5.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_elasticache6_id                   = "${length(data.aws_subnet.elasticache6.*.id) > 0 ? element(concat(data.aws_subnet.elasticache6.*.id, list("")), 0) : null}"
  subnet_elasticache6_availability_zone    = "${length(data.aws_subnet.elasticache6.*.availability_zone) > 0 ? element(concat(data.aws_subnet.elasticache6.*.availability_zone, list("")), 0) : null}"
  subnet_elasticache6_availability_zone_id = "${length(data.aws_subnet.elasticache6.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.elasticache6.*.availability_zone_id, list("")), 0) : null}"
  subnet_elasticache6_cidr_block           = "${length(data.aws_subnet.elasticache6.*.cidr_block) > 0 ? element(concat(data.aws_subnet.elasticache6.*.cidr_block, list("")), 0) : null}"
  subnet_elasticache6_ipv6_cidr_block      = "${length(data.aws_subnet.elasticache6.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.elasticache6.*.ipv6_cidr_block, list("")), 0) : null}"

  # Redshift subnet information
  subnet_redshift1_id                   = "${length(data.aws_subnet.redshift1.*.id) > 0 ? element(concat(data.aws_subnet.redshift1.*.id, list("")), 0) : null}"
  subnet_redshift1_availability_zone    = "${length(data.aws_subnet.redshift1.*.availability_zone) > 0 ? element(concat(data.aws_subnet.redshift1.*.availability_zone, list("")), 0) : null}"
  subnet_redshift1_availability_zone_id = "${length(data.aws_subnet.redshift1.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.redshift1.*.availability_zone_id, list("")), 0) : null}"
  subnet_redshift1_cidr_block           = "${length(data.aws_subnet.redshift1.*.cidr_block) > 0 ? element(concat(data.aws_subnet.redshift1.*.cidr_block, list("")), 0) : null}"
  subnet_redshift1_ipv6_cidr_block      = "${length(data.aws_subnet.redshift1.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.redshift1.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_redshift2_id                   = "${length(data.aws_subnet.redshift2.*.id) > 0 ? element(concat(data.aws_subnet.redshift2.*.id, list("")), 0) : null}"
  subnet_redshift2_availability_zone    = "${length(data.aws_subnet.redshift2.*.availability_zone) > 0 ? element(concat(data.aws_subnet.redshift2.*.availability_zone, list("")), 0) : null}"
  subnet_redshift2_availability_zone_id = "${length(data.aws_subnet.redshift2.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.redshift2.*.availability_zone_id, list("")), 0) : null}"
  subnet_redshift2_cidr_block           = "${length(data.aws_subnet.redshift2.*.cidr_block) > 0 ? element(concat(data.aws_subnet.redshift2.*.cidr_block, list("")), 0) : null}"
  subnet_redshift2_ipv6_cidr_block      = "${length(data.aws_subnet.redshift2.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.redshift2.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_redshift3_id                   = "${length(data.aws_subnet.redshift3.*.id) > 0 ? element(concat(data.aws_subnet.redshift3.*.id, list("")), 0) : null}"
  subnet_redshift3_availability_zone    = "${length(data.aws_subnet.redshift3.*.availability_zone) > 0 ? element(concat(data.aws_subnet.redshift3.*.availability_zone, list("")), 0) : null}"
  subnet_redshift3_availability_zone_id = "${length(data.aws_subnet.redshift3.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.redshift3.*.availability_zone_id, list("")), 0) : null}"
  subnet_redshift3_cidr_block           = "${length(data.aws_subnet.redshift3.*.cidr_block) > 0 ? element(concat(data.aws_subnet.redshift3.*.cidr_block, list("")), 0) : null}"
  subnet_redshift3_ipv6_cidr_block      = "${length(data.aws_subnet.redshift3.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.redshift3.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_redshift4_id                   = "${length(data.aws_subnet.redshift4.*.id) > 0 ? element(concat(data.aws_subnet.redshift4.*.id, list("")), 0) : null}"
  subnet_redshift4_availability_zone    = "${length(data.aws_subnet.redshift4.*.availability_zone) > 0 ? element(concat(data.aws_subnet.redshift4.*.availability_zone, list("")), 0) : null}"
  subnet_redshift4_availability_zone_id = "${length(data.aws_subnet.redshift4.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.redshift4.*.availability_zone_id, list("")), 0) : null}"
  subnet_redshift4_cidr_block           = "${length(data.aws_subnet.redshift4.*.cidr_block) > 0 ? element(concat(data.aws_subnet.redshift4.*.cidr_block, list("")), 0) : null}"
  subnet_redshift4_ipv6_cidr_block      = "${length(data.aws_subnet.redshift4.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.redshift4.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_redshift5_id                   = "${length(data.aws_subnet.redshift5.*.id) > 0 ? element(concat(data.aws_subnet.redshift5.*.id, list("")), 0) : null}"
  subnet_redshift5_availability_zone    = "${length(data.aws_subnet.redshift5.*.availability_zone) > 0 ? element(concat(data.aws_subnet.redshift5.*.availability_zone, list("")), 0) : null}"
  subnet_redshift5_availability_zone_id = "${length(data.aws_subnet.redshift5.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.redshift5.*.availability_zone_id, list("")), 0) : null}"
  subnet_redshift5_cidr_block           = "${length(data.aws_subnet.redshift5.*.cidr_block) > 0 ? element(concat(data.aws_subnet.redshift5.*.cidr_block, list("")), 0) : null}"
  subnet_redshift5_ipv6_cidr_block      = "${length(data.aws_subnet.redshift5.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.redshift5.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_redshift6_id                   = "${length(data.aws_subnet.redshift6.*.id) > 0 ? element(concat(data.aws_subnet.redshift6.*.id, list("")), 0) : null}"
  subnet_redshift6_availability_zone    = "${length(data.aws_subnet.redshift6.*.availability_zone) > 0 ? element(concat(data.aws_subnet.redshift6.*.availability_zone, list("")), 0) : null}"
  subnet_redshift6_availability_zone_id = "${length(data.aws_subnet.redshift6.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.redshift6.*.availability_zone_id, list("")), 0) : null}"
  subnet_redshift6_cidr_block           = "${length(data.aws_subnet.redshift6.*.cidr_block) > 0 ? element(concat(data.aws_subnet.redshift6.*.cidr_block, list("")), 0) : null}"
  subnet_redshift6_ipv6_cidr_block      = "${length(data.aws_subnet.redshift6.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.redshift6.*.ipv6_cidr_block, list("")), 0) : null}"
}