# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "../../../modules/SourceAccountIAM/"
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
  # The current account or Atlantis Server Account
  name        = "SourceAccountRole"
  path        = "/"
  description = "Managed by Terraform for Atlantis"
  max_session_duration  = 36000
  force_detach_policies = true
}
