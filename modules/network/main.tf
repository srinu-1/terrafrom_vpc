# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = var.vpc_id

  tags = merge(
    var.network_tags,
    {
      Name = local.igw_name
    }
  )
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = merge(
    var.network_tags,
    {
      Name = local.eip_name
    }
  )
}

# NAT Gateway
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(
    var.network_tags,
    {
      Name = local.nat_name
    }
  )

  depends_on = [aws_internet_gateway.main]
}

# Public Subnets
resource "aws_subnet" "public" {
  count             = length(var.azs)
  vpc_id            = var.vpc_id
  cidr_block        = local.public_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = merge(
    var.network_tags,
    {
      Name = local.public_subnet_names[count.index]
    }
  )
}

# Private Subnets
resource "aws_subnet" "private" {
  count             = length(var.azs)
  vpc_id            = var.vpc_id
  cidr_block        = local.private_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = merge(
    var.network_tags,
    {
      Name = local.private_subnet_names[count.index]
    }
  )
}

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(
    var.network_tags,
    {
      Name = local.public_rt_name
    }
  )
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = merge(
    var.network_tags,
    {
      Name = local.private_rt_name
    }
  )
}

# Public Route Table Association
resource "aws_route_table_association" "public" {
  count          = length(var.azs)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Private Route Table Association
resource "aws_route_table_association" "private" {
  count          = length(var.azs)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

