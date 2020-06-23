data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["${var.vpc_name}"]
  }
}

# Get VPC info
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
data "aws_route_tables" "default" {
  count  = 1
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*default"
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
# Get all db subnet ids
data "aws_subnet_ids" "db" {
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
# Get all intra subnet ids
data "aws_subnet_ids" "intra" {
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*ntra*"
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
data "aws_route_tables" "private" {
  count  = 1
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*rivate"
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

data "aws_route_tables" "public" {
  count  = 1
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*ublic"
  }
}

# Database subnet names
data "aws_subnet" "db1" {
  count  = "${var.subnet_name_db1 != "" && local.db_subnet_count >= 1 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*db*${var.subnet_name_db1}*"
  }
}
data "aws_subnet" "db2" {
  count  = "${var.subnet_name_db2 != "" && local.db_subnet_count >= 2 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*db*${var.subnet_name_db2}*"
  }
}
data "aws_subnet" "db3" {
  count  = "${var.subnet_name_db3 != "" && local.db_subnet_count >= 3 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*db*${var.subnet_name_db3}*"
  }
}
data "aws_subnet" "db4" {
  count  = "${var.subnet_name_db4 != "" && local.db_subnet_count >= 4 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*db*${var.subnet_name_db4}*"
  }
}
data "aws_subnet" "db5" {
  count  = "${var.subnet_name_db5 != "" && local.db_subnet_count >= 5 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*db*${var.subnet_name_db5}*"
  }
}
data "aws_subnet" "db6" {
  count  = "${var.subnet_name_db6 != "" && local.db_subnet_count >= 6 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*db*${var.subnet_name_db6}*"
  }
}
data "aws_route_tables" "db" {
  count  = 1
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*db"
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
data "aws_route_tables" "elasticache" {
  count  = 1
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*lasticache"
  }
}

# Intra subnet names
data "aws_subnet" "intra1" {
  count  = "${var.subnet_name_intra1 != "" && local.intra_subnet_count >= 1 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*ntra*${var.subnet_name_intra1}*"
  }
}
data "aws_subnet" "intra2" {
  count  = "${var.subnet_name_intra2 != "" && local.intra_subnet_count >= 2 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*ntra*${var.subnet_name_intra2}*"
  }
}
data "aws_subnet" "intra3" {
  count  = "${var.subnet_name_intra3 != "" && local.intra_subnet_count >= 3 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*ntra*${var.subnet_name_intra3}*"
  }
}
data "aws_subnet" "intra4" {
  count  = "${var.subnet_name_intra4 != "" && local.intra_subnet_count >= 4 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*ntra*${var.subnet_name_intra4}*"
  }
}
data "aws_subnet" "intra5" {
  count  = "${var.subnet_name_intra5 != "" && local.intra_subnet_count >= 5 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*ntra*${var.subnet_name_intra5}*"
  }
}
data "aws_subnet" "intra6" {
  count  = "${var.subnet_name_intra6 != "" && local.intra_subnet_count >= 6 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*ntra*${var.subnet_name_intra6}*"
  }
}
data "aws_route_tables" "intra" {
  count  = 1
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*ntra"
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
data "aws_route_tables" "redshift" {
  count  = 1
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "*edshift"
  }
}

locals {
  # VPC info
  default_network_acl_id    = "${element(concat(sort(data.aws_network_acls.default.*.ids[0]), sort(list(""))), 0)}"
  default_security_group_id = "${length(data.aws_security_groups.default.*.ids[0]) > 0 ? element(concat(data.aws_security_groups.default.*.ids[0], list("")), 0) : null}"
  default_route_table_id    = "${element(concat(sort(data.aws_route_tables.default.*.ids[0]), sort(list(""))), 0)}"

  # General subnet info
  private_subnet_count              = "${length(data.aws_subnet_ids.private.ids)}"
  private_subnet_ids                = "${data.aws_subnet_ids.private.ids}"
  private_subnet_route_table_id     = "${element(concat(sort(data.aws_route_tables.private.*.ids[0]), sort(list(""))), 0)}"
  public_subnet_count               = "${length(data.aws_subnet_ids.public.ids)}"
  public_subnet_ids                 = "${data.aws_subnet_ids.public.ids}"
  public_subnet_route_table_id      = "${element(concat(sort(data.aws_route_tables.public.*.ids[0]), sort(list(""))), 0)}"
  db_subnet_count                   = "${length(data.aws_subnet_ids.db.ids)}"
  db_subnet_ids                     = "${data.aws_subnet_ids.db.ids}"
  db_subnet_route_table_id          = "${element(concat(sort(data.aws_route_tables.db.*.ids[0]), sort(list(""))), 0)}"
  elasticache_subnet_count          = "${length(data.aws_subnet_ids.elasticache.ids)}"
  elasticache_subnet_ids            = "${data.aws_subnet_ids.elasticache.ids}"
  elasticache_subnet_route_table_id = "${element(concat(sort(data.aws_route_tables.elasticache.*.ids[0]), sort(list(""))), 0)}"
  intra_subnet_count                = "${length(data.aws_subnet_ids.intra.ids)}"
  intra_subnet_ids                  = "${data.aws_subnet_ids.intra.ids}"
  intra_subnet_route_table_id       = "${element(concat(sort(data.aws_route_tables.intra.*.ids[0]), sort(list(""))), 0)}"
  redshift_subnet_count             = "${length(data.aws_subnet_ids.redshift.ids)}"
  redshift_subnet_ids               = "${data.aws_subnet_ids.redshift.ids}"
  redshift_subnet_route_table_id    = "${element(concat(sort(data.aws_route_tables.redshift.*.ids[0]), sort(list(""))), 0)}"

  ################################################################################################################
  # Private subnet information
  ################################################################################################################
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

  ################################################################################################################
  # Public subnet information
  ################################################################################################################
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

  ################################################################################################################
  # Database subnet information
  ################################################################################################################
  subnet_db1_id                   = "${length(data.aws_subnet.db1.*.id) > 0 ? element(concat(data.aws_subnet.db1.*.id, list("")), 0) : null}"
  subnet_db1_availability_zone    = "${length(data.aws_subnet.db1.*.availability_zone) > 0 ? element(concat(data.aws_subnet.db1.*.availability_zone, list("")), 0) : null}"
  subnet_db1_availability_zone_id = "${length(data.aws_subnet.db1.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.db1.*.availability_zone_id, list("")), 0) : null}"
  subnet_db1_cidr_block           = "${length(data.aws_subnet.db1.*.cidr_block) > 0 ? element(concat(data.aws_subnet.db1.*.cidr_block, list("")), 0) : null}"
  subnet_db1_ipv6_cidr_block      = "${length(data.aws_subnet.db1.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.db1.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_db2_id                   = "${length(data.aws_subnet.db2.*.id) > 0 ? element(concat(data.aws_subnet.db2.*.id, list("")), 0) : null}"
  subnet_db2_availability_zone    = "${length(data.aws_subnet.db2.*.availability_zone) > 0 ? element(concat(data.aws_subnet.db2.*.availability_zone, list("")), 0) : null}"
  subnet_db2_availability_zone_id = "${length(data.aws_subnet.db2.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.db2.*.availability_zone_id, list("")), 0) : null}"
  subnet_db2_cidr_block           = "${length(data.aws_subnet.db2.*.cidr_block) > 0 ? element(concat(data.aws_subnet.db2.*.cidr_block, list("")), 0) : null}"
  subnet_db2_ipv6_cidr_block      = "${length(data.aws_subnet.db2.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.db2.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_db3_id                   = "${length(data.aws_subnet.db3.*.id) > 0 ? element(concat(data.aws_subnet.db3.*.id, list("")), 0) : null}"
  subnet_db3_availability_zone    = "${length(data.aws_subnet.db3.*.availability_zone) > 0 ? element(concat(data.aws_subnet.db3.*.availability_zone, list("")), 0) : null}"
  subnet_db3_availability_zone_id = "${length(data.aws_subnet.db3.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.db3.*.availability_zone_id, list("")), 0) : null}"
  subnet_db3_cidr_block           = "${length(data.aws_subnet.db3.*.cidr_block) > 0 ? element(concat(data.aws_subnet.db3.*.cidr_block, list("")), 0) : null}"
  subnet_db3_ipv6_cidr_block      = "${length(data.aws_subnet.db3.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.db3.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_db4_id                   = "${length(data.aws_subnet.db4.*.id) > 0 ? element(concat(data.aws_subnet.db4.*.id, list("")), 0) : null}"
  subnet_db4_availability_zone    = "${length(data.aws_subnet.db4.*.availability_zone) > 0 ? element(concat(data.aws_subnet.db4.*.availability_zone, list("")), 0) : null}"
  subnet_db4_availability_zone_id = "${length(data.aws_subnet.db4.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.db4.*.availability_zone_id, list("")), 0) : null}"
  subnet_db4_cidr_block           = "${length(data.aws_subnet.db4.*.cidr_block) > 0 ? element(concat(data.aws_subnet.db4.*.cidr_block, list("")), 0) : null}"
  subnet_db4_ipv6_cidr_block      = "${length(data.aws_subnet.db4.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.db4.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_db5_id                   = "${length(data.aws_subnet.db5.*.id) > 0 ? element(concat(data.aws_subnet.db5.*.id, list("")), 0) : null}"
  subnet_db5_availability_zone    = "${length(data.aws_subnet.db5.*.availability_zone) > 0 ? element(concat(data.aws_subnet.db5.*.availability_zone, list("")), 0) : null}"
  subnet_db5_availability_zone_id = "${length(data.aws_subnet.db5.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.db5.*.availability_zone_id, list("")), 0) : null}"
  subnet_db5_cidr_block           = "${length(data.aws_subnet.db5.*.cidr_block) > 0 ? element(concat(data.aws_subnet.db5.*.cidr_block, list("")), 0) : null}"
  subnet_db5_ipv6_cidr_block      = "${length(data.aws_subnet.db5.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.db5.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_db6_id                   = "${length(data.aws_subnet.db6.*.id) > 0 ? element(concat(data.aws_subnet.db6.*.id, list("")), 0) : null}"
  subnet_db6_availability_zone    = "${length(data.aws_subnet.db6.*.availability_zone) > 0 ? element(concat(data.aws_subnet.db6.*.availability_zone, list("")), 0) : null}"
  subnet_db6_availability_zone_id = "${length(data.aws_subnet.db6.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.db6.*.availability_zone_id, list("")), 0) : null}"
  subnet_db6_cidr_block           = "${length(data.aws_subnet.db6.*.cidr_block) > 0 ? element(concat(data.aws_subnet.db6.*.cidr_block, list("")), 0) : null}"
  subnet_db6_ipv6_cidr_block      = "${length(data.aws_subnet.db6.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.db6.*.ipv6_cidr_block, list("")), 0) : null}"

  ################################################################################################################
  # Elasticache subnet information
  ################################################################################################################
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

  ################################################################################################################
  # Intra subnet information
  ################################################################################################################
  subnet_intra1_id                   = "${length(data.aws_subnet.intra1.*.id) > 0 ? element(concat(data.aws_subnet.intra1.*.id, list("")), 0) : null}"
  subnet_intra1_availability_zone    = "${length(data.aws_subnet.intra1.*.availability_zone) > 0 ? element(concat(data.aws_subnet.intra1.*.availability_zone, list("")), 0) : null}"
  subnet_intra1_availability_zone_id = "${length(data.aws_subnet.intra1.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.intra1.*.availability_zone_id, list("")), 0) : null}"
  subnet_intra1_cidr_block           = "${length(data.aws_subnet.intra1.*.cidr_block) > 0 ? element(concat(data.aws_subnet.intra1.*.cidr_block, list("")), 0) : null}"
  subnet_intra1_ipv6_cidr_block      = "${length(data.aws_subnet.intra1.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.intra1.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_intra2_id                   = "${length(data.aws_subnet.intra2.*.id) > 0 ? element(concat(data.aws_subnet.intra2.*.id, list("")), 0) : null}"
  subnet_intra2_availability_zone    = "${length(data.aws_subnet.intra2.*.availability_zone) > 0 ? element(concat(data.aws_subnet.intra2.*.availability_zone, list("")), 0) : null}"
  subnet_intra2_availability_zone_id = "${length(data.aws_subnet.intra2.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.intra2.*.availability_zone_id, list("")), 0) : null}"
  subnet_intra2_cidr_block           = "${length(data.aws_subnet.intra2.*.cidr_block) > 0 ? element(concat(data.aws_subnet.intra2.*.cidr_block, list("")), 0) : null}"
  subnet_intra2_ipv6_cidr_block      = "${length(data.aws_subnet.intra2.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.intra2.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_intra3_id                   = "${length(data.aws_subnet.intra3.*.id) > 0 ? element(concat(data.aws_subnet.intra3.*.id, list("")), 0) : null}"
  subnet_intra3_availability_zone    = "${length(data.aws_subnet.intra3.*.availability_zone) > 0 ? element(concat(data.aws_subnet.intra3.*.availability_zone, list("")), 0) : null}"
  subnet_intra3_availability_zone_id = "${length(data.aws_subnet.intra3.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.intra3.*.availability_zone_id, list("")), 0) : null}"
  subnet_intra3_cidr_block           = "${length(data.aws_subnet.intra3.*.cidr_block) > 0 ? element(concat(data.aws_subnet.intra3.*.cidr_block, list("")), 0) : null}"
  subnet_intra3_ipv6_cidr_block      = "${length(data.aws_subnet.intra3.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.intra3.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_intra4_id                   = "${length(data.aws_subnet.intra4.*.id) > 0 ? element(concat(data.aws_subnet.intra4.*.id, list("")), 0) : null}"
  subnet_intra4_availability_zone    = "${length(data.aws_subnet.intra4.*.availability_zone) > 0 ? element(concat(data.aws_subnet.intra4.*.availability_zone, list("")), 0) : null}"
  subnet_intra4_availability_zone_id = "${length(data.aws_subnet.intra4.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.intra4.*.availability_zone_id, list("")), 0) : null}"
  subnet_intra4_cidr_block           = "${length(data.aws_subnet.intra4.*.cidr_block) > 0 ? element(concat(data.aws_subnet.intra4.*.cidr_block, list("")), 0) : null}"
  subnet_intra4_ipv6_cidr_block      = "${length(data.aws_subnet.intra4.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.intra4.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_intra5_id                   = "${length(data.aws_subnet.intra5.*.id) > 0 ? element(concat(data.aws_subnet.intra5.*.id, list("")), 0) : null}"
  subnet_intra5_availability_zone    = "${length(data.aws_subnet.intra5.*.availability_zone) > 0 ? element(concat(data.aws_subnet.intra5.*.availability_zone, list("")), 0) : null}"
  subnet_intra5_availability_zone_id = "${length(data.aws_subnet.intra5.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.intra5.*.availability_zone_id, list("")), 0) : null}"
  subnet_intra5_cidr_block           = "${length(data.aws_subnet.intra5.*.cidr_block) > 0 ? element(concat(data.aws_subnet.intra5.*.cidr_block, list("")), 0) : null}"
  subnet_intra5_ipv6_cidr_block      = "${length(data.aws_subnet.intra5.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.intra5.*.ipv6_cidr_block, list("")), 0) : null}"

  subnet_intra6_id                   = "${length(data.aws_subnet.intra6.*.id) > 0 ? element(concat(data.aws_subnet.intra6.*.id, list("")), 0) : null}"
  subnet_intra6_availability_zone    = "${length(data.aws_subnet.intra6.*.availability_zone) > 0 ? element(concat(data.aws_subnet.intra6.*.availability_zone, list("")), 0) : null}"
  subnet_intra6_availability_zone_id = "${length(data.aws_subnet.intra6.*.availability_zone_id) > 0 ? element(concat(data.aws_subnet.intra6.*.availability_zone_id, list("")), 0) : null}"
  subnet_intra6_cidr_block           = "${length(data.aws_subnet.intra6.*.cidr_block) > 0 ? element(concat(data.aws_subnet.intra6.*.cidr_block, list("")), 0) : null}"
  subnet_intra6_ipv6_cidr_block      = "${length(data.aws_subnet.intra6.*.ipv6_cidr_block) > 0 ? element(concat(data.aws_subnet.intra6.*.ipv6_cidr_block, list("")), 0) : null}"

  ################################################################################################################
  # Redshift subnet information
  ################################################################################################################
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