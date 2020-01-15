provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn     = "arn:aws:iam::${var.account_nember}:role/AdminRoleForResourceCreation"
    session_name = "${var.atlantis_user}-${var.atlantis_repo_owner}-${var.atlantis_repo_name}-${var.atlantis_pull_num}"
  }
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

# Use this module as a source if you want to destroy something.
# Change source to this module
