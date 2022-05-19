variable "aws_region" {
  description = "AWS region to provision"
  default     = "us-east-1"
}

variable "aws_access_key" {
  description = "IAM User Access Key with S3 access"
  type = string
  sensitive = true
}

variable "aws_secret_key" {
  description = "IAM User Secret Key with S3 access"
  type = string
  sensitive = true
}