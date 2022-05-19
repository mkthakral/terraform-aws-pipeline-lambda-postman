# terraform_yaml_json_converter
This repository can be used to provision infratructure of a Serverless App & its corresponding CI/CD pipeline.

The application source code is assumed to be in different CodeCommit repository

* For serverless app, we use AWS Lambda
* For CI/CD pipeline, we use AWS CodePipeline


## Tools

* Terraform v1.1.8

## Prerequisite

* Terraform installation
* AWS IAM user access & secret keys with Admin Access or Access for CodePipeline, S3, CodeBuild, Lambda, IAM

## Usage
* Use variables

There are values that you can change as per need, if one doesn't use variables, default values would be used. All variables can be viewed in variables.tf files

_Variable Examples:_

aws_region = us-east-1

aws_lambda_function_name = lambda_terraform_v1

aws_pipeline_name = Terraform_Yaml_Json_Pipeline_v1

...more...

_Variable Usage:_

While running Terraform apply command, use following syntax to update values of variables

```
terraform apply -var="<variable_name>=<variable_value>" -var="<variable_name>=<variable_value>"
```

* To generate S3 bucket for Terraform state - Run only once
```
cd 1_STEP-create_tf_state_bucket
terraform init
terraform plan
<To use variables, check steps above>
terraform apply
<Provide IAM user access key>
<Provide IAM user secret key>
```
* Create AWS Lambda & CI/CD Pipeline to deploy code to Lambda & run automated tests
```
cd 2_STEP-create_infrastucture
terraform init
terraform plan
<To use variables, check steps above>
terraform apply
<Provide IAM user access key>
<Provide IAM user secret key>
```
* Output
  
  Terraform apply command should result in two outputs on console

  Pipeline_Name  : Name of the CI/CD pipeline, responsible for Deployment & Testing

  Lambda_URL     : URL to test code built using Lambda Function URL

* Start Pipeline

  Go to AWS console & start the Pipeline 
  

* Automated Testing

  The source code repository & pipeline is built for automated testing, output of which can be found under "Test Stage" -> "Reports"

* Manual Testing

  The deployed code can also be tested manually using any API Testing tool
  
  The API URL can be taken from "Output" steps above

  [Follow the link for API Documentation](https://documenter.getpostman.com/view/1332921/UyrBkc4d)



## Further Enhancement
* Add more Test Cases in Testing Stage
* Add Code Quality Review in Pipeline
* Add Performance Test stage

## Alternate Solutions
* Instead of Lambda Function URL, API Gateway can be used.
