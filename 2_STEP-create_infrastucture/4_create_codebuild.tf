
resource "aws_codebuild_project" "codebuild" {
  badge_enabled  = false
  build_timeout  = 60
  name           = var.aws_codebuild_name
  queued_timeout = 480
  service_role   = aws_iam_role.iam_codebuild.arn
  

  artifacts {
    encryption_disabled = false
    override_artifact_name = true
    packaging = "NONE"
    type      = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true
    type                        = "LINUX_CONTAINER"
  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }

    s3_logs {
      encryption_disabled = false
      status              = "DISABLED"
    }
  }

  source {
    # buildspec           = data.template_file.buildspec.rendered
    git_clone_depth     = 0
    insecure_ssl        = false
    report_build_status = false
    type                = "CODEPIPELINE"
    #buildspec = "${var.local_dir_source_code}/buildspec.yml"
  }
}