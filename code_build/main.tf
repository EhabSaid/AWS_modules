
resource "aws_codebuild_project" "codebuild_deployment" {
  name          = var.codebuild_name
  description   = var.codebuild_description
  build_timeout = "60"
  service_role  = var.code_build_role

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "BUILD_GENERAL1_MEDIUM"
    image        = var.codebuild_image
    type         = "LINUX_CONTAINER"

    dynamic "environment_variable" {
      for_each = var.passing_variables
      content {
        name  = environment_variable.key
        value = environment_variable.value
      }
    }
  }

  source {
    ############# adding connection
    type = "GITHUB"
    # location        = "https://github.com/mitchellh/packer.git"
    location        = var.repo_link
    git_clone_depth = 1
    buildspec       = var.buildspec_location
  }

  tags = {
    Name        = var.codebuild_name
    Environment = var.env_tag
  }
}
