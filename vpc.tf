# Creating VPC

resource "aws_vpc" "my_vpc" {
    cidr_block              = "${var.vpc-cidr}"
    instance_tenancy        = "default"
    enable_dns_hostnames    = "${var.vpc-enable-dns-host-names}"

    tags     = {
      "Name" = "Terraform_vpc"
    }
}

# Creating an Internet Gateway and attaching it to VPC

resource "aws_internet_gateway" "My_Internet_gateway" {
  vpc_id    = aws_vpc.my_vpc.id

  tags     = {
    "Name" = "my_internet_gateway"
  }
}

# Creating Public Subnet

resource "aws_subnet" "public-subnet" {
  vpc_id                    = aws_vpc.my_vpc.id
  cidr_block                = "${var.public-subnet-cidr}"
  availability_zone         = "${var.public-subnet-availability_zone}"
  map_public_ip_on_launch   = "${var.public-subnet-public-ip-mapping}"

  tags     = {
    "Name" = "Public Subnet"
  }
}

# Creating Route table and adding Public Route

resource "aws_route_table" "public_route" {
  vpc_id        = aws_vpc.my_vpc.id

  route {
    cidr_block  = "${var.public-route-table-cidr-block}"
    gateway_id  = aws_internet_gateway.My_Internet_gateway.id
  }

  tags     = {
    "Name" = "Public_route"
  }
}

# Associating Public Subnet to Public Route table

resource "aws_route_table_association" "public-subnet-route-table-association" {
  subnet_id         = aws_subnet.public-subnet.id
  route_table_id    = aws_route_table.public_route.id
}



# Creating Private Subnet 1 for app tier

resource "aws_subnet" "private_subnet-1" {
  vpc_id                     = aws_vpc.my_vpc.id
  cidr_block                 = "${var.private-subnet-1-cidr}"
  availability_zone          = "${var.private-subnet-1-availability_zone}"
  map_public_ip_on_launch    =  "${var.private-subnet-public-ip-mapping}"
 
  tags = {
    "Name" = "Private Subnet 1 | App Tier"
  }
}

# Creating Private Subnet 2 for database tier

resource "aws_subnet" "private_subnet-2" {
  cidr_block            = "${var.private-subnet-2-cidr}"
  vpc_id                = aws_vpc.my_vpc.id
  availability_zone     = "${var.private-subnet-2-availability_zone}"
  map_public_ip_on_launch = "${var.private-subnet-public-ip-mapping}"
  
  tags     = {
    "Name" = "Private Subnet 2 | database Tier"
  }
}


