resource "aws_vpc" "dev" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "dev"
    Env  = "dev"
  }

}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = "dev-gw"
    Env  = "dev"
  }
}


resource "aws_route_table" "default" {
  vpc_id = aws_vpc.dev.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "default"
    Env  = "dev"
  }
}

resource "aws_main_route_table_association" "default" {
  vpc_id         = aws_vpc.dev.id
  route_table_id = aws_route_table.default.id
}


resource "aws_subnet" "dev-public-a" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "dev-public-a"
    Env  = "dev"
  }
}

resource "aws_subnet" "dev-public-b" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "dev-public-b"
    Env  = "dev"
  }
}

resource "aws_subnet" "dev-public-c" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "${var.region}c"
  map_public_ip_on_launch = true

  tags = {
    Name = "dev-public-c"
    Env  = "dev"
  }
}

resource "aws_subnet" "dev-private-a" {
  vpc_id            = aws_vpc.dev.id
  cidr_block        = "10.0.128.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "dev-private-a"
    Env  = "dev"
  }
}

resource "aws_subnet" "dev-private-b" {
  vpc_id            = aws_vpc.dev.id
  cidr_block        = "10.0.129.0/24"
  availability_zone = "${var.region}b"

  tags = {
    Name = "dev-private-b"
    Env  = "dev"
  }
}

resource "aws_subnet" "dev-private-c" {
  vpc_id            = aws_vpc.dev.id
  cidr_block        = "10.0.130.0/24"
  availability_zone = "${var.region}c"

  tags = {
    Name = "dev-private-c"
    Env  = "dev"
  }
}

