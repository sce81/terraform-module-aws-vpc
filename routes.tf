resource "aws_route_table" "public" {

    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }

    tags = {
    Name                = "${var.brand}-${var.env}-routetable-public"
    Environment         = "${var.env}"

  }
}

resource "aws_route_table" "private" {
    count               = var.nat_gateway_count

    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = element(aws_nat_gateway.gw[*].id, count.index)
    }

    tags = {
    Name                = "${var.brand}-${var.env}-routetable-private-${count.index +1}"
    Environment         = "${var.env}"

  }
}
resource "aws_route_table_association" "public" {
    count               = var.public_subnet_count

  subnet_id             = element(aws_subnet.public[*].id, count.index)
  route_table_id        = element(aws_route_table.public[*].id, count.index)
}

resource "aws_route_table_association" "private" {
    count               = var.private_subnet_count

  subnet_id             = element(aws_subnet.private[*].id, count.index)
  route_table_id        = element(aws_route_table.private[*].id, count.index)
}
