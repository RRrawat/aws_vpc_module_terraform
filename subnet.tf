
# Create Public Subnet 1
resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.vpc_test.id
  cidr_block              = "${var.public-subnet-1-cidr}"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true #it makes this a public subnet

  tags      = {
    Name    = "Public_Subnet 1"
  }
}

# Create Public Subnet 2
resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.vpc_test.id
  cidr_block              = "${var.public-subnet-2-cidr}"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true #it makes this a public subnet

  tags      = {
    Name    = "Public_Subnet 2"
  }
}


# Create Private Subnet 1
resource "aws_subnet" "private-subnet-1" {
  vpc_id                  = aws_vpc.vpc_test.id
  cidr_block              = "${var.private-subnet-1-cidr}"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true #it makes this a private subnet

  tags      = {
    Name    = "private_Subnet 1"
  }
}

# Create private Subnet 2
resource "aws_subnet" "private-subnet-2" {
  vpc_id                  = aws_vpc.vpc_test.id
  cidr_block              = "${var.private-subnet-2-cidr}"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true #it makes this a private subnet

  tags      = {
    Name    = "private-subnet-2"
  }
}


# Create Private Subnet 1
resource "aws_subnet" "private-subnet-3" {
  vpc_id                  = aws_vpc.vpc_test.id
  cidr_block              = "${var.private-subnet-3-cidr}"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true #it makes this a private subnet

  tags      = {
    Name    = "private_Subnet 3"
  }
}

# Create private Subnet 2
resource "aws_subnet" "private-subnet-4" {
  vpc_id                  = aws_vpc.vpc_test.id
  cidr_block              = "${var.private-subnet-4-cidr}"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true #it makes this a private subnet

  tags      = {
    Name    = "private-subnet-4"
  }
}

