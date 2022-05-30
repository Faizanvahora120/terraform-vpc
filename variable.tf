variable "aws_region" {
  description = "adding default region"
  type = string
}

variable "vpc-cidr" {
    description = "VPC CIDR Block"
    type        = string
}

variable "vpc-enable-dns-host-names" {
    description = "Enable hostnames"
    type        = string
  
}


variable "public-subnet-cidr" {
    description = "Public Subnet CIDR Block"
    type = string
}



variable "public-subnet-availability_zone" {
    description = "Public Subnet availability zone"
    type        = string
}


variable "private-subnet-1-cidr" {
    description = "Private Subnet 1 CIDR Block for app tier"
    type        = string
}

variable "private-subnet-private-ip-mapping" {
    default     =  false
    description = "private ip mapping for private subnet"
    type        = string
  
}

variable "private-subnet-1-availability_zone" {
    description = "Private Subnet 1 availaibility zone for app tier"
    type        = string
}

variable "private-subnet-2-availability_zone" {
    description = "Private Subnet 1 availaibility zone for database tier"
    type        = string
}

variable "private-subnet-2-cidr" {
    description = "Private Subnet 2 CIDR for database tier"
    type        = string
}

variable "public-route-table-cidr-block" {
    description = "Private Subnet 2 CIDR for database tier"
    type        = string
}

variable "public-subnet-public-ip-mapping" {
    description = "public ip mapping for public subnet"
    type        = string
  
}

variable "private-subnet-public-ip-mapping" {
    description = "public ip mapping for private subnet"
    type        = string
  
}







