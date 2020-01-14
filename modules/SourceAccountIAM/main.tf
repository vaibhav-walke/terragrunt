provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn     = "arn:aws:iam::${var.account_nember}:role/AssumeRole"
    session_name = var.atlantis_user}-${var.atlantis_repo_owner}-${var.atlantis_repo_name}-${var.atlantis_pull_num
  }
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

# Terraform module which creates IAM Role and IAM Policy resources on AWS.
#
# https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html

# https://www.terraform.io/docs/providers/aws/r/iam_role.html
resource "aws_iam_role" "sourceaccountrole" {
  name               = var.name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  path        = var.path
  description = var.description

  max_session_duration  = var.max_session_duration
  force_detach_policies = var.force_detach_policies
}

# https://www.terraform.io/docs/providers/aws/r/iam_policy.html
resource "aws_iam_policy" "sourceaccountrolepolicy" {
  name   = var.name
  policy = data.aws_iam_policy_document.policy.json

  path        = var.path
  description = var.description
}

# https://www.terraform.io/docs/providers/aws/r/iam_role_policy_attachment.html
resource "aws_iam_role_policy_attachment" "sourceaccountrolepolicyattach" {
  role       = aws_iam_role.default.name
  policy_arn = aws_iam_policy.default.arn
}


data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole",
    ]
  }
}

data "aws_iam_policy_document" "policy" {
  statement {
    effect = "Allow"

    actions = [
      "s3:*",
    ]

    resources = ["*"]
  }
}