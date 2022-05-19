resource "aws_lambda_function" "lambda_terraform" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  filename      = "../source_code/sample_python_lambda.zip"
  function_name = var.aws_lambda_function_name
  handler       = "lambda_function.lambda_handler"
  role          = aws_iam_role.iam_lambda.arn

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  #source_code_hash = filebase64sha256("resources/aws/lambda/lambda.zip")

  runtime = "python3.8"

}


resource "aws_lambda_function_url" "lambda_url" {
  function_name      = aws_lambda_function.lambda_terraform.arn
  authorization_type = "NONE"
}


