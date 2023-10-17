
resource "aws_iam_role" "codebuild_role" {

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
        },
        {
        "Effect": "Allow",
        "Principal": {
            "AWS": "arn:aws:iam::${var.deployment_account_id}:role/${var.x_codebuild_role_name}"
        },
        "Action": "sts:AssumeRole"
    }]
}
EOF

}

resource "aws_iam_role_policy" "codebuild_policy" {
  role = aws_iam_role.codebuild_role.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Effect": "Allow",
        "Action": [
            "ec2:*",
            "s3:*",
            "cloudfront:*",
            "cloudwatch:*",
            "config:*",
            "backup:*",
            "backup-storage:*",
            "dynamodb:*",
            "iam:*",
            "guardduty:*",
            "cloudtrail:*",
            "ssm:*",
            "logs:*",
            "route53:*",
            "route53resolver:*",
            "ds:*",
            "events:*",
            "sns:*",
            "sqs:*",
            "kms:*",
            "ram:*",
            "lambda:*",
            "autoscaling:*",
            "directconnect:*",
            "sts:GetCallerIdentity",
            "sts:AssumeRole",
            "elasticfilesystem:*",
            "elasticloadbalancing:*",
            "secretsmanager:*",
            "ecr:*",
            "codestar-connections:UseConnection",
            "codebuild:*",
            "codepipeline:*",
            "codecommit:*",
            "cloudformation:*",
            "iot:*",
            "apigateway:*",
            "cognito-idp:*",
            "kinesis:*",
            "qldb:*"
        ],
        "Resource": "*"
    }
    ]
}
POLICY

}
