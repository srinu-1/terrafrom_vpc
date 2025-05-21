locals {
  # VPC naming
  vpc_name = "${var.environment}-vpc"

  # Common tags
  common_tags = merge(
    var.vpc_tags,
    {
      Name        = local.vpc_name
      Environment = var.environment
    }
  )
} 