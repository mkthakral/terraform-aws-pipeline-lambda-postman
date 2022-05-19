
resource "aws_s3_bucket" "pipeline_bucket" {
  bucket = var.aws_s3_artifacts_bucket_name
}

resource "aws_codepipeline" "app_pipeline" {
  name     = var.aws_pipeline_name
  role_arn = aws_iam_role.iam_pipeline.arn
 

  artifact_store {
    location = aws_s3_bucket.pipeline_bucket.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name = "Source"
      category = "Source"
      owner     = "AWS"
      provider  = "CodeCommit"
      run_order = 1
      version   = "1"
      configuration = {
        "RepositoryName" = var.aws_codecommit_souce_code_repository
        "BranchName" = var.aws_codecommit_souce_code_repository_branch
      }
      input_artifacts = []
      output_artifacts = ["SourceArtifact"]
      
    }
  }


  stage {
    name = "Build"

    action {
      category = "Build"
      configuration = {
        "EnvironmentVariables" = jsonencode(
          [
            {
              name  = "lambda_function_name"
              type  = "PLAINTEXT"
              value = var.aws_lambda_function_name
            }
          ]
        )
        "ProjectName" = aws_codebuild_project.codebuild.name
      }
      input_artifacts = [
        "SourceArtifact",
      ]
      name = "Build"
      output_artifacts = [
        "BuildArtifact",
      ]
      owner     = "AWS"
      provider  = "CodeBuild"
      run_order = 1
      version   = "1"
    }
  }

  stage {
    name = "Test"

    action {
      category = "Build"
      configuration = {
        "EnvironmentVariables" = jsonencode(
          [
            {
              name  = "API_URL"
              type  = "PLAINTEXT"
              value = "${aws_lambda_function_url.lambda_url.function_url}"
            }
          ]
        )
        "ProjectName" = aws_codebuild_project.code_build_test.name
      }
      input_artifacts = [
        "SourceArtifact",
      ]
      name = "Build"
      output_artifacts = [
        "BuildArtifactTest",
      ]
      owner     = "AWS"
      provider  = "CodeBuild"
      run_order = 1
      version   = "1"
    }
  }

  depends_on = [
    aws_codebuild_project.codebuild,
    aws_codebuild_project.code_build_test,
    aws_s3_bucket.pipeline_bucket
  ]
}
