resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames


  tags = merge(
    local.common_tags, var.extra_tags,
    tomap({
      Name = "${var.name}-${var.env}-vpc"
    })
  )

}

resource "aws_default_security_group" "main" {
  vpc_id = aws_vpc.main.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }
}

resource "aws_subnet" "public" {
  count             = length(var.public_subnet_cidr)
  vpc_id            = aws_vpc.main.id
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  cidr_block        = element(var.public_subnet_cidr, count.index)


  tags = merge(
    local.common_tags, var.extra_tags, var.public_extra_tags,
    tomap({
      Name = "${var.name}-${var.env}-public-az${count.index + 1}"
    })
  )
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidr)
  vpc_id            = aws_vpc.main.id
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  cidr_block        = element(var.private_subnet_cidr, count.index)


  tags = merge(
    local.common_tags, var.extra_tags, var.private_extra_tags,
    tomap({
      Name = "${var.name}-${var.env}-private-az${count.index + 1}"
    })
  )
}

resource "aws_subnet" "database" {
  count             = length(var.database_subnet_cidr)
  vpc_id            = aws_vpc.main.id
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  cidr_block        = element(var.database_subnet_cidr, count.index)


  tags = merge(
    local.common_tags, var.extra_tags, var.database_extra_tags,
    tomap({
      Name = "${var.name}-${var.env}-database-az${count.index + 1}"
    })
  )
}