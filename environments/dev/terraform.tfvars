environment = "dev"
aws_region  = "us-east-1"
vpc_cidr    = "10.0.0.0/16"  # Dev VPC CIDR

# VPC Settings
enable_dns_hostnames = true
enable_dns_support   = true
instance_tenancy     = "default"

tags = {
  Environment = "dev"
  Project     = "Custom-VPC"
  Owner       = "Srinivas"
} 