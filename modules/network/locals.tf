locals {
  # Calculating subnet CIDRs
  public_subnet_cidrs  = [for i in range(4) : cidrsubnet(var.vpc_cidr, 4, i)]
  private_subnet_cidrs = [for i in range(4) : cidrsubnet(var.vpc_cidr, 4, i + 4)]

  # Generating subnet names
  public_subnet_names  = [for i in range(4) : "${var.environment}-public-subnet-${i + 1}"]
  private_subnet_names = [for i in range(4) : "${var.environment}-private-subnet-${i + 1}"]

  # Generating gateway and route table names
  igw_name       = "${var.environment}-igw"
  nat_name       = "${var.environment}-nat"
  eip_name       = "${var.environment}-nat-eip"
  public_rt_name = "${var.environment}-public-rt"
  private_rt_name = "${var.environment}-private-rt"
}















