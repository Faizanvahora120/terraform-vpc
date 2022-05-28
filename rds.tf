# Create Database Subnet Group

resource "aws_db_subnet_group" "database-subnet-group" {
  name = "database subnets 1"
  subnet_ids = [aws_subnet.private_subnet-1.id,aws_subnet.private_subnet-2.id]
  description = "Subnet for Database Instance"

  tags = {
    "Name" = "Database Subnets 1"
  }
}