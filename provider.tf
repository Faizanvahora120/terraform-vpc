provider "aws" {
  region     = "${var.aws_region}"
}

# S3 bucket to store terraform state files

terraform {
  backend "s3" {
    bucket = "terraform-state-2oi938"
    key    = "myapp/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraformtfstate"
  }
}