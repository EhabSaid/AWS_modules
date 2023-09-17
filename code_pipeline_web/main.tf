resource "aws_codepipeline" "codepipeline_deployment" {
  name     = var.codepipeline_name
  role_arn = var.code_pipeline_role

  tags = {
    Name        = var.codepipeline_name
    Environment = var.env_tag
  }

  artifact_store {
    location = var.code_pipeline_artifact_bucket
    type     = "S3"
  }

  stage {
    name = "PrimarySource"

    action {
      name             = "PrimarySource"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output1"]

      configuration = {
        ConnectionArn    = "${var.github_connection_arn}"
        FullRepositoryId = "${var.primary_full_repository_id}" #"my-organization/example"
        BranchName       = "${var.primary_branch_name}"        #"main"
      }
    }
  }

  stage {
    name = "S3WebSync"

    action {
      name            = "S3WebSync"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["source_output1"]
      version         = "1"

      configuration = {
        ProjectName = var.codebuild_tf_project
        #PrimarySource= "source_output1"
      }
    }
  }

}
