# Allocating Elastic IP Address (EIP 1)

resource "aws_eip" "eip-for-nat-gateway-1" {
    vpc = true

    tags = {
      "Name" = "EIP 1"
    }
  
}

# Creating Nat Gateway 1 in Public Subnet 1 

resource "aws_nat_gateway" "nat-gateway-1" {
    allocation_id   = aws_eip.eip-for-nat-gateway-1.id
    subnet_id       = aws_subnet.public-subnet.id

    tags = {
      "Name" = "Nat Gateway Public Subnet 1"
    }
  
}

# Creating Private Route table 1 and adding route through Nat Gateway 1

resource "aws_route_table" "private-route-table-1" {
  vpc_id = aws_vpc.my_vpc.id

  route {
      cidr_block      = "0.0.0.0/0"
      nat_gateway_id  = aws_nat_gateway.nat-gateway-1.id
  }

  tags = {
    "Name" = "Private Route table 1"
  }
}

# Associating Private Subnet1 (app) with Private Route table 1

resource "aws_route_table_association" "private-subnet-1-route-table-association" {
  subnet_id      = aws_subnet.private_subnet-1.id
  route_table_id = aws_route_table.private-route-table-1.id
}

# Associating Private Subnet2 (database) with Private Route table 1

resource "aws_route_table_association" "private-subnet-2-route-table-association" {
  subnet_id      = aws_subnet.private_subnet-2.id
  route_table_id = aws_route_table.private-route-table-1.id
}



