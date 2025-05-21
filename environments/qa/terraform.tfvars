environment = "qa"
aws_region  = "us-east-1"
vpc_cidr    = "10.2.0.0/16"  # QA VPC CIDR

# VPC Settings
enable_dns_hostnames = true
enable_dns_support   = true
instance_tenancy     = "default"

vpc_tags = {
  Environment = "qa"
  Project     = "Custom-VPC"
  Owner       = "Srinivas"
} 