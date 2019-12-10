variable "vpc_name" {
  description = "Name of the VPC"
}

# Private subnet names
variable "subnet_name_private1" {
  description = "Name of Private Subnet 1"
}
variable "subnet_name_private2" {
  description = "Name of Private Subnet 2"
  default     = ""
}
variable "subnet_name_private3" {
  description = "Name of Private Subnet 3"
  default     = ""
}
variable "subnet_name_private4" {
  description = "Name of Private Subnet 4"
  default     = ""
}
variable "subnet_name_private5" {
  description = "Name of Private Subnet 5"
  default     = ""
}
variable "subnet_name_private6" {
  description = "Name of Private Subnet 6"
  default     = ""
}

# Public subnet names
variable "subnet_name_public1" {
  description = "Name of Public Subnet 1"
}
variable "subnet_name_public2" {
  description = "Name of Public Subnet 2"
  default     = ""
}
variable "subnet_name_public3" {
  description = "Name of Public Subnet 3"
  default     = ""
}
variable "subnet_name_public4" {
  description = "Name of Public Subnet 4"
  default     = ""
}
variable "subnet_name_public5" {
  description = "Name of Public Subnet 5"
  default     = ""
}
variable "subnet_name_public6" {
  description = "Name of Public Subnet 6"
  default     = ""
}

variable "has_nat_gw_public1" {
  description = "Set to yes when Public Subnet 1 hosts a NAT gateway"
  type        = bool
  default     = false
}
variable "has_nat_gw_public2" {
  description = "Set to yes when Public Subnet 2 hosts a NAT gateway"
  type        = bool
  default     = false
}
variable "has_nat_gw_public3" {
  description = "Set to yes when Public Subnet 3 hosts a NAT gateway"
  type        = bool
  default     = false
}
variable "has_nat_gw_public4" {
  description = "Set to yes when Public Subnet 4 hosts a NAT gateway"
  type        = bool
  default     = false
}
variable "has_nat_gw_public5" {
  description = "Set to yes when Public Subnet 4 hosts a NAT gateway"
  type        = bool
  default     = false
}
variable "has_nat_gw_public6" {
  description = "Set to yes when Public Subnet 4 hosts a NAT gateway"
  type        = bool
  default     = false
}

# Database subnet names
variable "subnet_name_database1" {
  description = "Name of Database Subnet 1"
  default     = ""
}
variable "subnet_name_database2" {
  description = "Name of Database Subnet 2"
  default     = ""
}
variable "subnet_name_database3" {
  description = "Name of Database Subnet 3"
  default     = ""
}
variable "subnet_name_database4" {
  description = "Name of Database Subnet 4"
  default     = ""
}
variable "subnet_name_database5" {
  description = "Name of Database Subnet 5"
  default     = ""
}
variable "subnet_name_database6" {
  description = "Name of Database Subnet 6"
  default     = ""
}

# Elasticache subnet names
variable "subnet_name_elasticache1" {
  description = "Name of Elasticache Subnet 1"
  default     = ""
}
variable "subnet_name_elasticache2" {
  description = "Name of Elasticache Subnet 2"
  default     = ""
}
variable "subnet_name_elasticache3" {
  description = "Name of Elasticache Subnet 3"
  default     = ""
}
variable "subnet_name_elasticache4" {
  description = "Name of Elasticache Subnet 4"
  default     = ""
}
variable "subnet_name_elasticache5" {
  description = "Name of Elasticache Subnet 5"
  default     = ""
}
variable "subnet_name_elasticache6" {
  description = "Name of Elasticache Subnet 6"
  default     = ""
}

# Redshift subnet names
variable "subnet_name_redshift1" {
  description = "Name of Redshift Subnet 1"
  default     = ""
}
variable "subnet_name_redshift2" {
  description = "Name of Redshift Subnet 2"
  default     = ""
}
variable "subnet_name_redshift3" {
  description = "Name of Redshift Subnet 3"
  default     = ""
}
variable "subnet_name_redshift4" {
  description = "Name of Redshift Subnet 4"
  default     = ""
}
variable "subnet_name_redshift5" {
  description = "Name of Redshift Subnet 5"
  default     = ""
}
variable "subnet_name_redshift6" {
  description = "Name of Redshift Subnet 6"
  default     = ""
}

