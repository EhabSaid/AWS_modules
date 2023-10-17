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
    name = "Source_Stage"

    action {
      name             = "PrimarySource"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      run_order        = "1"
      output_artifacts = ["source_output1"]

      configuration = {
        ConnectionArn    = "${var.github_connection_arn}"
        FullRepositoryId = "${var.primary_full_repository_id}" #"my-organization/example"
        BranchName       = "${var.primary_branch_name}"        #"main"
      }
    }
  }

  stage {
    name = "Source_Stage"

    action {
      name             = "SecondarySource"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      run_order        = "1"
      output_artifacts = ["source_output2"]

      configuration = {
        ConnectionArn    = "${var.github_connection_arn}"
        FullRepositoryId = "${var.secondary_full_repository_id}"
        BranchName       = "${var.primary_branch_name}"
      }
    }
  }
  stage {
    name = "Plan_Stage"

    action {
      name            = "TerraformPlan_dev_acc"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["source_output1"]
      version         = "1"
      run_order       = "2"

      configuration = {
        ProjectName   = var.primary_codebuild_tf_plan_project
        PrimarySource = "source_output1"
      }
    }
  }

  stage {
    name = "Plan_Stage"

    action {
      name            = "TerraformPlan_slv_acc"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["source_output2"]
      version         = "1"
      run_order       = "2"

      configuration = {
        ProjectName   = var.secondary_codebuild_tf_plan_project
        PrimarySource = "source_output2"
      }
    }
  }

  stage {
    name = "ManualApproval"

    action {
      name     = "ManualApproval"
      category = "Approval"
      owner    = "AWS"
      provider = "Manual"
      version  = "1"
      # configuration {
      # NotificationArn = "${var.approve_sns_arn}"
      # CustomData = "${var.approve_comment}"
      # ExternalEntityLink = "${var.approve_url}"
      # }
    }
  }

  stage {
    name = "Apply_Stage"

    action {
      name            = "TerraformApply_dev_acc"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["source_output1"]
      version         = "1"
      run_order       = "3"

      configuration = {
        ProjectName   = var.primary_codebuild_tf_apply_project
        PrimarySource = "source_output1"
      }
    }
  }

  stage {
    name = "Apply_Stage"

    action {
      name            = "TerraformApply_slv_acc"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["source_output2"]
      version         = "1"
      run_order       = "3"

      configuration = {
        ProjectName   = var.secondary_codebuild_tf_apply_project
        PrimarySource = "source_output2"
      }
    }
  }

  stage {
    name = "WebRepoInvokation"

    action {
      name            = "WebRepoInvokation"
      category        = "Invoke"
      owner           = "AWS"
      provider        = "Lambda"
      input_artifacts = ["source_output1"]
      version         = "1"

      configuration = {
        FunctionName = var.lambda_project
      }
    }
  }

}
