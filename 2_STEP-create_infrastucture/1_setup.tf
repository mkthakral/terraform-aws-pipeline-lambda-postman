terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket = "my-tf-state-bucket-mkthakral"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}