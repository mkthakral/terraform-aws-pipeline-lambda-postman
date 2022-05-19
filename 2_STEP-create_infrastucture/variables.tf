variable "aws_region" {
  description = "AWS Region where infra will be provisioned"
  type = string
  default = "us-east-1"
}

variable "aws_access_key" {
  description = "AWS IAM user access key"
  type = string
  sensitive = true
}

variable "aws_secret_key" {
  description = "AWS IAM user secret key"
  type = string
  sensitive = true
}

variable "aws_lambda_function_name" {
  description = "AWS Lambda function name"
  type = string
  default = "lambda_terraform_v1"
}

variable "aws_pipeline_name" {
  description = "AWS Pipeline name"
  type = string
  default = "Terraform_Yaml_Json_Pipeline_v1"
}

variable "aws_codebuild_name" {
  description = "AWS CodeBuild name"
  type = string
  default = "Terraform_Yaml_Json_CodeBuild_v1"
}

variable "aws_codebuild_tests_name" {
  description = "AWS CodeBuild Tests name"
  type = string
  default = "Terraform_Yaml_Json_CodeBuild_Tests_v1"
}

variable "aws_s3_artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "cicd-artifacts-bucket-15223756461"
}

variable "aws_s3_bucket_tfstate" {
  description = "S3 Bucket for storing Terraform state"
  default     = "aws_s3_bucket_tfstate-15223756461"
}

variable "aws_codecommit_souce_code_repository" {
  description = "Source code Repository Name"
  default     = "lambda_yaml_json_converter_without_packages"
}

variable "aws_codecommit_souce_code_repository_branch" {
  description = "Source code Repository Branch"
  default     = "master"
}

variable "local_dir_source_code" {
  description = "Directory that contains source code"
  default     = "2_STEP-create_infrastucture/source_code/python"
}

variable "local_dir_source_code_tmp" {
  description = "Directory that contains source code"
  default     = "source_code_tmp"
}