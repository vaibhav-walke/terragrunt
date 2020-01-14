# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "../../../modules/TargetAccountIAM/"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

locals {
  default_yaml_path = find_in_parent_folders("empty.yaml")

  global = yamldecode(
    file(find_in_parent_folders("global_locals.yaml", local.default_yaml_path))
  )
}


# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  # The current account
  name        = "the-role-name"
  path        = "/engineering/admin/"
  description = "Managed by Terraform"

  # Maximum login session for that role
  max_session_duration = "36000"

  # Policies to create and attach
  policies = [{
    name = "policy-1-name",
    path = "/",
    desc = "Description 1",
    file = "data/policy1.json"
  },{
    name = "policy-2-name",
    path = "/",
    desc = "Description 2",
    file = "data/policy2.json"
  ]}

  # Handle policies exclusively (declarative vs imperative)
  exclusive_policy_attachment = "true"

  # The account from which to assume the current account
  assumer_account_id        = "1234567890"
  assumer_account_role_name = "AWS-Admins"
  assumer_account_role_path = "/"

  tags = {
    Name  = "dev-admin-role"
    Env   = "dev"
    Owner = "terraform"
  }
}
