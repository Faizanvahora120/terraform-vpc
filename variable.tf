variable "access_key" {
    default = "AKIASDA4PIGEHGGLGC3P"
    description = "AWS Access key value"
    type = string
  
}

variable "secret_key" {
    default = "O6KM/nfUgCiuHUv0yn+Q45TwmM8P9xk5CAeT5vLs"
    description = "AWS Secret key value"
    type = string
  
}

variable "AWS_REGION" {
    default = "us-east-1"
    description = "AWS Region"
  
}

variable "vpc-cidr" {
    default =  "10.0.0.0/16"
    description = "VPC CIDR Block"
    type = string
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

variable "private-subnet-1-availability_zone" {
    default = "us-east-1a"
    description = "Private Subnet 1 availaibility zone for app tier"
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









