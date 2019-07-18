data "aws_vpc" "selected" {
  filter {
    name   = "name"
    values = ["${var.vpc_name}"]
  }
}

# Get all private subnet ids
data "aws_subnet_ids" "private" {
  vpc_id = "${data.aws_vpc.selected.id}"

  filter {
    name   = "name"
    values = ["*rivate*"]
  }
}

# Get all public subnet ids
data "aws_subnet_ids" "public" {
  vpc_id = "${data.aws_vpc.selected.id}"

  filter {
    name   = "name"
    values = ["*ublic"]
  }
}

data "aws_subnet" "private1" {
  count = "${var.nr_of_azs_private >= 1 ? 1 : 0}"

  tags {
    name = "${var.subnet_name_private1}"
  }
}


data "aws_subnet" "private2" {
  count  = "${var.nr_of_azs_private >= 2 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags {
    name = "${var.subnet_name_private2}"
  }
}

data "aws_subnet" "private3" {
  count  = "${var.nr_of_azs_private >= 3 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags {
    name = "${var.subnet_name_private3}"
  }
}

data "aws_subnet" "private4" {
  count  = "${var.nr_of_azs_private >= 4 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags {
    name = "${var.subnet_name_private4}"
  }
}

data "aws_subnet" "public1" {
  count  = "${var.nr_of_azs_public >= 1 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags {
    name = "${var.subnet_name_public1}"
  }
}

data "aws_subnet" "public2" {
  count  = "${var.nr_of_azs_public >= 2 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags {
    name = "${var.subnet_name_public2}"
  }
}

data "aws_subnet" "public3" {
  count  = "${var.nr_of_azs_public >= 3 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags {
    name = "${var.subnet_name_public3}"
  }
}

data "aws_subnet" "public4" {
  count  = "${var.nr_of_azs_public >= 4 ? 1 : 0}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags {
    name = "${var.subnet_name_public4}"
  }
}

locals {
  nr_of_azs_private = "${length(data.aws_subnet_ids.public.ids)}"
  nr_of_azs_public  = "${length(data.aws_subnet_ids.public.ids)}"

  subnet_private1_id         = "${length(data.aws_subnet.private1.*.id) > 0 ? element(concat(data.aws_subnet.private1.*.id, list("")), 0) : "Not existing"}"
  subnet_private1_cidr_block = "${length(data.aws_subnet.private1.*.cidr_block) > 0 ? element(concat(data.aws_subnet.private1.*.cidr_block, list("")), 0) : "Not existing"}"

  subnet_private2_id         = "${length(data.aws_subnet.private2.*.id) > 0 ? element(concat(data.aws_subnet.private2.*.id, list("")), 0) : "Not existing"}"
  subnet_private2_cidr_block = "${length(data.aws_subnet.private2.*.cidr_block) > 0 ? element(concat(data.aws_subnet.private2.*.cidr_block, list("")), 0) : "Not existing"}"

  subnet_private3_id         = "${length(data.aws_subnet.private3.*.id) > 0 ? element(concat(data.aws_subnet.private3.*.id, list("")), 0) : "Not existing"}"
  subnet_private3_cidr_block = "${length(data.aws_subnet.private3.*.cidr_block) > 0 ? element(concat(data.aws_subnet.private3.*.cidr_block, list("")), 0) : "Not existing"}"

  subnet_private4_id         = "${length(data.aws_subnet.private4.*.id) > 0 ? element(concat(data.aws_subnet.private4.*.id, list("")), 0) : "Not existing"}"
  subnet_private4_cidr_block = "${length(data.aws_subnet.private4.*.cidr_block) > 0 ? element(concat(data.aws_subnet.private4.*.cidr_block, list("")), 0) : "Not existing"}"

  subnet_public1_id         = "${length(data.aws_subnet.public1.*.id) > 0 ? element(concat(data.aws_subnet.public1.*.id, list("")), 0) : "Not existing"}"
  subnet_public1_cidr_block = "${length(data.aws_subnet.public1.*.cidr_block) > 0 ? element(concat(data.aws_subnet.public1.*.cidr_block, list("")), 0) : "Not existing"}"

  subnet_public2_id         = "${length(data.aws_subnet.public2.*.id) > 0 ? element(concat(data.aws_subnet.public2.*.id, list("")), 0) : "Not existing"}"
  subnet_public2_cidr_block = "${length(data.aws_subnet.public2.*.cidr_block) > 0 ? element(concat(data.aws_subnet.public2.*.cidr_block, list("")), 0) : "Not existing"}"

  subnet_public3_id         = "${length(data.aws_subnet.public3.*.id) > 0 ? element(concat(data.aws_subnet.public3.*.id, list("")), 0) : "Not existing"}"
  subnet_public3_cidr_block = "${length(data.aws_subnet.public3.*.cidr_block) > 0 ? element(concat(data.aws_subnet.public3.*.cidr_block, list("")), 0) : "Not existing"}"

  subnet_public4_id         = "${length(data.aws_subnet.public4.*.id) > 0 ? element(concat(data.aws_subnet.public4.*.id, list("")), 0) : "Not existing"}"
  subnet_public4_cidr_block = "${length(data.aws_subnet.public4.*.cidr_block) > 0 ? element(concat(data.aws_subnet.public4.*.cidr_block, list("")), 0) : "Not existing"}"

}
