
resource "aws_iam_role" "codebuild_role_other_accounts" {

  name = var.x_codebuild_role_name

  tags = {
    Name        = var.x_codebuild_role_name
    Environment = var.env_tag
  }

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [{
        "Effect": "Allow",
        "Principal": {
            "Service": "codebuild.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
    }]
}
EOF

}

resource "aws_iam_role_policy" "codebuild_policy" {
  role = aws_iam_role.codebuild_role_other_accounts.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "sts:AssumeRole",
    "Resource": "arn:aws:iam::${var.deployment_account_id}:role/${var.cross-account-role-name}"
  }
}
POLICY

}