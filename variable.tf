variable "aws_region" {
  default = "us-east-1"
  description = "adding default region"
  type = string
}

variable "vpc-cidr" {
    default     =  "10.0.0.0/16"
    description = "VPC CIDR Block"
    type        = string
}

variable "vpc-enable-dns-host-names" {
    default     = "true"
    description = "Enable hostnames"
    type        = string
  
}


variable "public-subnet-cidr" {
    default = "10.0.0.0/20"
    description = "Public Subnet CIDR Block"
    type = string
}



variable "public-subnet-availability_zone" {
    default = "us-east-1a"
    description = "Public Subnet availability zone"
    type = string
}


variable "private-subnet-1-cidr" {
    default = "10.0.16.0/20"
    description = "Private Subnet 1 CIDR Block for app tier"
    type = string
}

variable "private-subnet-private-ip-mapping" {
    default =  false
    description = "private ip mapping for private subnet"
    type = string
  
}

variable "private-subnet-1-availability_zone" {
    default = "us-east-1a"
    description = "Private Subnet 1 availaibility zone for app tier"
    type = string
}

variable "private-subnet-2-availability_zone" {
    default = "us-east-1b"
    description = "Private Subnet 1 availaibility zone for database tier"
    type = string
}

variable "private-subnet-2-cidr" {
    default = "10.0.32.0/20"
    description = "Private Subnet 2 CIDR for database tier"
    type = string
}

variable "public-route-table-cidr-block" {
    default = "0.0.0.0/0"
    description = "Private Subnet 2 CIDR for database tier"
    type = string
}

variable "public-subnet-public-ip-mapping" {
    default =  true
    description = "public ip mapping for public subnet"
    type = string
  
}

variable "private-subnet-public-ip-mapping" {
    default =  false
    description = "public ip mapping for private subnet"
    type = string
  
}







