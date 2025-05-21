environment = "prod"
aws_region  = "us-east-1"
vpc_cidr    = "10.3.0.0/16"  # Production VPC CIDR

# VPC Settings
enable_dns_hostnames = true
enable_dns_support   = true
instance_tenancy     = "default"

tags = {
  Environment = "prod"
  Project     = "Custom-VPC"
  Owner       = "Srinivas"
}

vpc_tags = {
  Environment = "prod"
  Project     = "Custom-VPC"
  Owner       = "Srinivas"
} 