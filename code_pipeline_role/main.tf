
resource "aws_iam_role" "codepipeline_role" {
  name = var.codepipeline_role_name

  tags = {
    Name        = var.codepipeline_role_name
    Environment = var.env_tag
  }

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [{
        "Effect": "Allow",
        "Principal": {
            "Service": "codepipeline.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
    }]
}
EOF

}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "codepipeline_policy"
  role = aws_iam_role.codepipeline_role.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [{
        "Effect":"Allow",
        "Action": [
            "s3:GetObject",
            "s3:PutObject",
            "s3:GetObjectVersion",
            "s3:GetBucketVersioning",
            "s3:PutObjectAcl"
        ],
        "Resource": [
            "${var.code_pipeline_artifact_bucket}",
            "${var.code_pipeline_artifact_bucket}/*"
        ]
    },
    {
        "Effect": "Allow",
        "Action": [
            "codebuild:BatchGetBuilds",
            "codebuild:StartBuild",
            "codecommit:GetFolder",
            "codecommit:GetFile",
            "codecommit:GetBranch",
            "codecommit:GetRepository",
            "codecommit:GitPull",
            "codecommit:GetCommit",
            "codecommit:UploadArchive",
            "codecommit:GetUploadArchiveStatus",
            "codestar-connections:UseConnection"
        ],
        "Resource": "*"
    },
    {
        "Action": [
            "lambda:InvokeFunction",
            "lambda:ListFunctions"
        ],
        "Resource": "*",
        "Effect": "Allow"
    }
    ]
}
EOF

}
