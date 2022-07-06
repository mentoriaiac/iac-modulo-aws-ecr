resource "aws_iam_user" "this" {
  name = "iac-${var.repo_name}-user"
  path = "/"

  tags = var.tags
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = [
      "ecr:GetAuthorizationToken"
    ]

    resources = [
      "*"
    ]
  }

  statement {
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:ListImages",
      "ecr:GetAuthorizationToken",
      "ecr:GetRepositoryPolicy",
      "ecr:GetDownloadUrlForLayer",
      "ecr:DescribeRepositories",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:BatchGetImage",
      "ecr:DescribeImages",
      "ecr:PutImage"
    ]

    resources = [
      "arn:aws:ecr:*:*:repository/${var.repo_name}"
    ]
  }
}

resource "aws_iam_policy" "this" {
  name   = "ecr-${aws_iam_user.this.name}-policy"
  policy = data.aws_iam_policy_document.this.json

  depends_on = [
    data.aws_iam_policy_document.this,
  ]

  tags = var.tags
}

resource "aws_iam_group" "this" {
  name = "ecr-${aws_iam_user.this.name}-group-${terraform.workspace}"
}

resource "aws_iam_user_group_membership" "this" {
  user = aws_iam_user.this.name

  groups = [
    aws_iam_group.this.name,
  ]
}

resource "aws_iam_group_policy_attachment" "this" {
  group      = aws_iam_group.this.name
  policy_arn = aws_iam_policy.this.arn
}
