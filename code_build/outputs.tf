output "code_build_project" {
  description = "ID of the code build project"
  value       = aws_codebuild_project.codebuild_deployment.id #aws_codebuild_project.codebuild_deployment.*.id 
}

