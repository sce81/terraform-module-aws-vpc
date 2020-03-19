resource "aws_vpc" "main" {
    cidr_block              = var.cidr_block

    enable_dns_support      = var.enable_dns_support
    enable_dns_hostnames    = var.enable_dns_hostnames

  tags = {
    Name                    = "${var.brand}-${var.env}-vpc"
    Environment             = "${var.env}"
  }

}

resource "aws_subnet" "public" {
    count               = var.public_subnet_count
    vpc_id              = aws_vpc.main.id
    availability_zone   = element(var.availability_zone, count.index)
    cidr_block          = element(var.public_subnet_cidr, count.index)

  tags = {
    Name                = "${var.brand}-${var.env}-public-${count.index +1}${substr(element(var.availability_zone, count.index), 9, 1)}"
    Environment         = "${var.env}"
  }
}

resource "aws_subnet" "private" {
    count               = var.private_subnet_count
    vpc_id              = aws_vpc.main.id
    availability_zone   = element(var.availability_zone, count.index)
    cidr_block          = element(var.private_subnet_cidr, count.index)

  tags = {
    Name                = "${var.brand}-${var.env}-private-${count.index +1}${substr(element(var.availability_zone, count.index), 9, 1)}"
    Environment         = "${var.env}"
  }
}

resource "aws_eip" "nat_gw" {
    count               = var.nat_gateway_count
    vpc                 = true

    tags = {
    Name                = "${var.brand}-${var.env}-natgw-eip-${count.index +1}${substr(element(var.availability_zone, count.index), 9, 1)}"
    Environment         = "${var.env}"

  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id                = aws_vpc.main.id
    
  tags = {
    Name                = "${var.brand}-${var.env}-igw"
    Environment         = "${var.env}"
  }
}

resource "aws_nat_gateway" "gw" {
    count               = var.nat_gateway_count
    allocation_id       = aws_eip.nat_gw[count.index].id
    subnet_id           = aws_subnet.public[count.index].id

  tags = {
    Name                = "${var.brand}-${var.env}-nat-gw-${count.index +1}${substr(element(var.availability_zone, count.index), 9, 1)}"
    Environment         = "${var.env}"

  }
  depends_on            = [aws_internet_gateway.gw]
}


