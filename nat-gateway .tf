# Allocate Elastic IP Address (EIP 1)
resource "aws_eip" "eip-for-nat-gateway" {
  vpc    = true #if we are putting this eip in vpc

  tags   = {
    Name = "${var.EIP-name}"
  }
}


# Create Nat Gateway 1 in Public Subnet 1
# terraform create aws nat gateway
resource "aws_nat_gateway" "nat-gateway-1" {
  allocation_id = aws_eip.eip-for-nat-gateway.id
  subnet_id     = aws_subnet.public-subnet-1.id

  tags   = {
    Name = "Netgateway-1"
  }
}
# Create Private Route Table 1 and Add Route Through Nat Gateway 1
# terraform aws create route table
resource "aws_route_table" "private-route-table" {
  vpc_id            = aws_vpc.vpc_test.id

  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.nat-gateway-1.id
  }

  tags   = {
    Name = "Private_RouteTable"
  }
}


# Associate Private Subnet 1 with "Private Route Table 1"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "private-subnet-1-route-table-association" {
  subnet_id         = aws_subnet.private-subnet-1.id
  route_table_id    = aws_route_table.private-route-table.id
}

# Associate Private Subnet 3 with "Private Route Table 1"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "private-subnet-2-route-table-association" {
  subnet_id         = aws_subnet.private-subnet-2.id
  route_table_id    = aws_route_table.private-route-table.id
}
 