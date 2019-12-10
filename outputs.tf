output "vpc_id" {
  value = data.aws_vpc.selected.id
}

# General
output "private_subnet_count" {
  value = local.private_subnet_count
}
output "private_subnet_ids" {
  value = local.private_subnet_ids
}
output "public_subnet_count" {
  value = local.public_subnet_count
}
output "public_subnet_ids" {
  value = local.public_subnet_ids
}
output "database_subnet_count" {
  value = local.database_subnet_count
}
output "database_subnet_ids" {
  value = local.database_subnet_ids
}
output "elasticache_subnet_count" {
  value = local.elasticache_subnet_count
}
output "elasticache_subnet_ids" {
  value = local.elasticache_subnet_ids
}
output "redshift_subnet_count" {
  value = local.redshift_subnet_count
}
output "redshift_subnet_ids" {
  value = local.redshift_subnet_ids
}

# Private subnet information
output "subnet_private1_id" {
  value = local.subnet_private1_id
}
output "subnet_private1_availability_zone" {
  value = local.subnet_private1_availability_zone
}
output "subnet_private1_availability_zone_id" {
  value = local.subnet_private1_availability_zone_id
}
output "subnet_private1_cidr_block" {
  value = local.subnet_private1_cidr_block
}
output "subnet_private1_ipv6_cidr_block" {
  value = local.subnet_private1_ipv6_cidr_block
}
output "subnet_private2_id" {
  value = local.subnet_private2_id
}
output "subnet_private2_availability_zone" {
  value = local.subnet_private2_availability_zone
}
output "subnet_private2_availability_zone_id" {
  value = local.subnet_private2_availability_zone_id
}
output "subnet_private2_cidr_block" {
  value = local.subnet_private2_cidr_block
}
output "subnet_private2_ipv6_cidr_block" {
  value = local.subnet_private2_ipv6_cidr_block
}
output "subnet_private3_id" {
  value = local.subnet_private3_id
}
output "subnet_private3_availability_zone" {
  value = local.subnet_private3_availability_zone
}
output "subnet_private3_availability_zone_id" {
  value = local.subnet_private3_availability_zone_id
}
output "subnet_private3_cidr_block" {
  value = local.subnet_private3_cidr_block
}
output "subnet_private3_ipv6_cidr_block" {
  value = local.subnet_private3_ipv6_cidr_block
}
output "subnet_private4_id" {
  value = local.subnet_private4_id
}
output "subnet_private4_availability_zone" {
  value = local.subnet_private4_availability_zone
}
output "subnet_private4_availability_zone_id" {
  value = local.subnet_private4_availability_zone_id
}
output "subnet_private4_cidr_block" {
  value = local.subnet_private4_cidr_block
}
output "subnet_private4_ipv6_cidr_block" {
  value = local.subnet_private4_ipv6_cidr_block
}
output "subnet_private5_id" {
  value = local.subnet_private5_id
}
output "subnet_private5_availability_zone" {
  value = local.subnet_private5_availability_zone
}
output "subnet_private5_availability_zone_id" {
  value = local.subnet_private5_availability_zone_id
}
output "subnet_private5_cidr_block" {
  value = local.subnet_private5_cidr_block
}
output "subnet_private5_ipv6_cidr_block" {
  value = local.subnet_private5_ipv6_cidr_block
}
output "subnet_private6_id" {
  value = local.subnet_private6_id
}
output "subnet_private6_availability_zone" {
  value = local.subnet_private6_availability_zone
}
output "subnet_private6_availability_zone_id" {
  value = local.subnet_private6_availability_zone_id
}
output "subnet_private6_cidr_block" {
  value = local.subnet_private6_cidr_block
}
output "subnet_private6_ipv6_cidr_block" {
  value = local.subnet_private6_ipv6_cidr_block
}

# Public subnet information
output "subnet_public1_id" {
  value = local.subnet_public1_id
}
output "subnet_public1_availability_zone" {
  value = local.subnet_public1_availability_zone
}
output "subnet_public1_availability_zone_id" {
  value = local.subnet_public1_availability_zone_id
}
output "subnet_public1_cidr_block" {
  value = local.subnet_public1_cidr_block
}
output "subnet_public1_ipv6_cidr_block" {
  value = local.subnet_public1_ipv6_cidr_block
}
output "subnet_public2_id" {
  value = local.subnet_public2_id
}
output "subnet_public2_availability_zone" {
  value = local.subnet_public2_availability_zone
}
output "subnet_public2_availability_zone_id" {
  value = local.subnet_public2_availability_zone_id
}
output "subnet_public2_cidr_block" {
  value = local.subnet_public2_cidr_block
}
output "subnet_public2_ipv6_cidr_block" {
  value = local.subnet_public2_ipv6_cidr_block
}
output "subnet_public3_id" {
  value = local.subnet_public3_id
}
output "subnet_public3_availability_zone" {
  value = local.subnet_public3_availability_zone
}
output "subnet_public3_availability_zone_id" {
  value = local.subnet_public3_availability_zone_id
}
output "subnet_public3_cidr_block" {
  value = local.subnet_public3_cidr_block
}
output "subnet_public3_ipv6_cidr_block" {
  value = local.subnet_public3_ipv6_cidr_block
}
output "subnet_public4_id" {
  value = local.subnet_public4_id
}
output "subnet_public4_availability_zone" {
  value = local.subnet_public4_availability_zone
}
output "subnet_public4_availability_zone_id" {
  value = local.subnet_public4_availability_zone_id
}
output "subnet_public4_cidr_block" {
  value = local.subnet_public4_cidr_block
}
output "subnet_public4_ipv6_cidr_block" {
  value = local.subnet_public4_ipv6_cidr_block
}
output "subnet_public5_id" {
  value = local.subnet_public5_id
}
output "subnet_public5_availability_zone" {
  value = local.subnet_public5_availability_zone
}
output "subnet_public5_availability_zone_id" {
  value = local.subnet_public5_availability_zone_id
}
output "subnet_public5_cidr_block" {
  value = local.subnet_public5_cidr_block
}
output "subnet_public5_ipv6_cidr_block" {
  value = local.subnet_public5_ipv6_cidr_block
}
output "subnet_public6_id" {
  value = local.subnet_public6_id
}
output "subnet_public6_availability_zone" {
  value = local.subnet_public6_availability_zone
}
output "subnet_public6_availability_zone_id" {
  value = local.subnet_public6_availability_zone_id
}
output "subnet_public6_cidr_block" {
  value = local.subnet_public6_cidr_block
}
output "subnet_public6_ipv6_cidr_block" {
  value = local.subnet_public6_ipv6_cidr_block
}

# Public NAT gateways  
output "subnet_public1_nat_gateway_id" {
  value = local.subnet_public1_nat_gateway_id
}
output "subnet_public2_nat_gateway_id" {
  value = local.subnet_public2_nat_gateway_id
}
output "subnet_public3_nat_gateway_id" {
  value = local.subnet_public3_nat_gateway_id
}
output "subnet_public4_nat_gateway_id" {
  value = local.subnet_public4_nat_gateway_id
}
output "subnet_public5_nat_gateway_id" {
  value = local.subnet_public5_nat_gateway_id
}
output "subnet_public6_nat_gateway_id" {
  value = local.subnet_public6_nat_gateway_id
}

# Public Default VPC resources
output "default_network_acl_id" {
  value = local.default_network_acl_id
}
output "default_security_group_id" {
  value = local.default_security_group_id
}

# Database subnet information
output "subnet_database1_id" {
  value = local.subnet_database1_id
}
output "subnet_database1_availability_zone" {
  value = local.subnet_database1_availability_zone
}
output "subnet_database1_availability_zone_id" {
  value = local.subnet_database1_availability_zone_id
}
output "subnet_database1_cidr_block" {
  value = local.subnet_database1_cidr_block
}
output "subnet_database1_ipv6_cidr_block" {
  value = local.subnet_database1_ipv6_cidr_block
}
output "subnet_database2_id" {
  value = local.subnet_database2_id
}
output "subnet_database2_availability_zone" {
  value = local.subnet_database2_availability_zone
}
output "subnet_database2_availability_zone_id" {
  value = local.subnet_database2_availability_zone_id
}
output "subnet_database2_cidr_block" {
  value = local.subnet_database2_cidr_block
}
output "subnet_database2_ipv6_cidr_block" {
  value = local.subnet_database2_ipv6_cidr_block
}
output "subnet_database3_id" {
  value = local.subnet_database3_id
}
output "subnet_database3_availability_zone" {
  value = local.subnet_database3_availability_zone
}
output "subnet_database3_availability_zone_id" {
  value = local.subnet_database3_availability_zone_id
}
output "subnet_database3_cidr_block" {
  value = local.subnet_database3_cidr_block
}
output "subnet_database3_ipv6_cidr_block" {
  value = local.subnet_database3_ipv6_cidr_block
}
output "subnet_database4_id" {
  value = local.subnet_database4_id
}
output "subnet_database4_availability_zone" {
  value = local.subnet_database4_availability_zone
}
output "subnet_database4_availability_zone_id" {
  value = local.subnet_database4_availability_zone_id
}
output "subnet_database4_cidr_block" {
  value = local.subnet_database4_cidr_block
}
output "subnet_database4_ipv6_cidr_block" {
  value = local.subnet_database4_ipv6_cidr_block
}
output "subnet_database5_id" {
  value = local.subnet_database5_id
}
output "subnet_database5_availability_zone" {
  value = local.subnet_database5_availability_zone
}
output "subnet_database5_availability_zone_id" {
  value = local.subnet_database5_availability_zone_id
}
output "subnet_database5_cidr_block" {
  value = local.subnet_database5_cidr_block
}
output "subnet_database5_ipv6_cidr_block" {
  value = local.subnet_database5_ipv6_cidr_block
}
output "subnet_database6_id" {
  value = local.subnet_database6_id
}
output "subnet_database6_availability_zone" {
  value = local.subnet_database6_availability_zone
}
output "subnet_database6_availability_zone_id" {
  value = local.subnet_database6_availability_zone_id
}
output "subnet_database6_cidr_block" {
  value = local.subnet_database6_cidr_block
}
output "subnet_database6_ipv6_cidr_block" {
  value = local.subnet_database6_ipv6_cidr_block
}

# Elasticache subnet information
output "subnet_elasticache1_id" {
  value = local.subnet_elasticache1_id
}
output "subnet_elasticache1_availability_zone" {
  value = local.subnet_elasticache1_availability_zone
}
output "subnet_elasticache1_availability_zone_id" {
  value = local.subnet_elasticache1_availability_zone_id
}
output "subnet_elasticache1_cidr_block" {
  value = local.subnet_elasticache1_cidr_block
}
output "subnet_elasticache1_ipv6_cidr_block" {
  value = local.subnet_elasticache1_ipv6_cidr_block
}
output "subnet_elasticache2_id" {
  value = local.subnet_elasticache2_id
}
output "subnet_elasticache2_availability_zone" {
  value = local.subnet_elasticache2_availability_zone
}
output "subnet_elasticache2_availability_zone_id" {
  value = local.subnet_elasticache2_availability_zone_id
}
output "subnet_elasticache2_cidr_block" {
  value = local.subnet_elasticache2_cidr_block
}
output "subnet_elasticache2_ipv6_cidr_block" {
  value = local.subnet_elasticache2_ipv6_cidr_block
}
output "subnet_elasticache3_id" {
  value = local.subnet_elasticache3_id
}
output "subnet_elasticache3_availability_zone" {
  value = local.subnet_elasticache3_availability_zone
}
output "subnet_elasticache3_availability_zone_id" {
  value = local.subnet_elasticache3_availability_zone_id
}
output "subnet_elasticache3_cidr_block" {
  value = local.subnet_elasticache3_cidr_block
}
output "subnet_elasticache3_ipv6_cidr_block" {
  value = local.subnet_elasticache3_ipv6_cidr_block
}
output "subnet_elasticache4_id" {
  value = local.subnet_elasticache4_id
}
output "subnet_elasticache4_availability_zone" {
  value = local.subnet_elasticache4_availability_zone
}
output "subnet_elasticache4_availability_zone_id" {
  value = local.subnet_elasticache4_availability_zone_id
}
output "subnet_elasticache4_cidr_block" {
  value = local.subnet_elasticache4_cidr_block
}
output "subnet_elasticache4_ipv6_cidr_block" {
  value = local.subnet_elasticache4_ipv6_cidr_block
}
output "subnet_elasticache5_id" {
  value = local.subnet_elasticache5_id
}
output "subnet_elasticache5_availability_zone" {
  value = local.subnet_elasticache5_availability_zone
}
output "subnet_elasticache5_availability_zone_id" {
  value = local.subnet_elasticache5_availability_zone_id
}
output "subnet_elasticache5_cidr_block" {
  value = local.subnet_elasticache5_cidr_block
}
output "subnet_elasticache5_ipv6_cidr_block" {
  value = local.subnet_elasticache5_ipv6_cidr_block
}
output "subnet_elasticache6_id" {
  value = local.subnet_elasticache6_id
}
output "subnet_elasticache6_availability_zone" {
  value = local.subnet_elasticache6_availability_zone
}
output "subnet_elasticache6_availability_zone_id" {
  value = local.subnet_elasticache6_availability_zone_id
}
output "subnet_elasticache6_cidr_block" {
  value = local.subnet_elasticache6_cidr_block
}
output "subnet_elasticache6_ipv6_cidr_block" {
  value = local.subnet_elasticache6_ipv6_cidr_block
}

# Redshift subnet information
output "subnet_redshift1_id" {
  value = local.subnet_redshift1_id
}
output "subnet_redshift1_availability_zone" {
  value = local.subnet_redshift1_availability_zone
}
output "subnet_redshift1_availability_zone_id" {
  value = local.subnet_redshift1_availability_zone_id
}
output "subnet_redshift1_cidr_block" {
  value = local.subnet_redshift1_cidr_block
}
output "subnet_redshift1_ipv6_cidr_block" {
  value = local.subnet_redshift1_ipv6_cidr_block
}
output "subnet_redshift2_id" {
  value = local.subnet_redshift2_id
}
output "subnet_redshift2_availability_zone" {
  value = local.subnet_redshift2_availability_zone
}
output "subnet_redshift2_availability_zone_id" {
  value = local.subnet_redshift2_availability_zone_id
}
output "subnet_redshift2_cidr_block" {
  value = local.subnet_redshift2_cidr_block
}
output "subnet_redshift2_ipv6_cidr_block" {
  value = local.subnet_redshift2_ipv6_cidr_block
}
output "subnet_redshift3_id" {
  value = local.subnet_redshift3_id
}
output "subnet_redshift3_availability_zone" {
  value = local.subnet_redshift3_availability_zone
}
output "subnet_redshift3_availability_zone_id" {
  value = local.subnet_redshift3_availability_zone_id
}
output "subnet_redshift3_cidr_block" {
  value = local.subnet_redshift3_cidr_block
}
output "subnet_redshift3_ipv6_cidr_block" {
  value = local.subnet_redshift3_ipv6_cidr_block
}
output "subnet_redshift4_id" {
  value = local.subnet_redshift4_id
}
output "subnet_redshift4_availability_zone" {
  value = local.subnet_redshift4_availability_zone
}
output "subnet_redshift4_availability_zone_id" {
  value = local.subnet_redshift4_availability_zone_id
}
output "subnet_redshift4_cidr_block" {
  value = local.subnet_redshift4_cidr_block
}
output "subnet_redshift4_ipv6_cidr_block" {
  value = local.subnet_redshift4_ipv6_cidr_block
}
output "subnet_redshift5_id" {
  value = local.subnet_redshift5_id
}
output "subnet_redshift5_availability_zone" {
  value = local.subnet_redshift5_availability_zone
}
output "subnet_redshift5_availability_zone_id" {
  value = local.subnet_redshift5_availability_zone_id
}
output "subnet_redshift5_cidr_block" {
  value = local.subnet_redshift5_cidr_block
}
output "subnet_redshift5_ipv6_cidr_block" {
  value = local.subnet_redshift5_ipv6_cidr_block
}
output "subnet_redshift6_id" {
  value = local.subnet_redshift6_id
}
output "subnet_redshift6_availability_zone" {
  value = local.subnet_redshift6_availability_zone
}
output "subnet_redshift6_availability_zone_id" {
  value = local.subnet_redshift6_availability_zone_id
}
output "subnet_redshift6_cidr_block" {
  value = local.subnet_redshift6_cidr_block
}
output "subnet_redshift6_ipv6_cidr_block" {
  value = local.subnet_redshift6_ipv6_cidr_block
}