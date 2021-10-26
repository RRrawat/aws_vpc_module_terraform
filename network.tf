
# Create Internet Gateway and Attach it to VPC
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id    = aws_vpc.vpc_test.id #referencing the id of the vpc

  tags      = {
    Name    = "Test_IGW"
  }
}



# Create Route Table and Add Public Route
resource "aws_route_table" "public-route-table" {
  vpc_id       = aws_vpc.vpc_test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags       = {
    Name     = "Route Table"
  }
}




# Associate Public Subnet 1 to "Public Route Table"
resource "aws_route_table_association" "public-subnet-1-route-table-association" {
  subnet_id           = aws_subnet.public-subnet-1.id #referencing subnet id
  route_table_id      = aws_route_table.public-route-table.id #referencing route tabble id
}

# Associate Public Subnet 2 to "Public Route Table"
resource "aws_route_table_association" "public-subnet-2-route-table-association" {
  subnet_id           = aws_subnet.public-subnet-2.id
  route_table_id      = aws_route_table.public-route-table.id
}

