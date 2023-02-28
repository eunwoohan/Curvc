

#VPC
resource "aws_vpc" "test_curvc_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "vpc-test_curvc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.test_curvc_vpc.id

  tags = {
    Name = "IGW"
  }
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet.id
}
resource "aws_internet_gateway_attachment" "test-gw-attachment" {
  internet_gateway_id = "${aws_internet_gateway.igw.id}"
  vpc_id              = "${aws_vpc.test_curvc_vpc.id}"
  lifecycle {
     create_before_destroy = true
  }
}