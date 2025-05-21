variable "aws_region" {}
variable "environment" {}
variable "vpc_cidr" {}
variable "tags" {}

variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "vpc_tags" {
  description = "Additional tags for VPC resources"
  type        = map(string)
  default     = {}
}
