# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "../../../web-server-modules/"
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
  name          = "webserver-example-qa"
  instance_type = "t2.micro"

  min_size = 2
  max_size = 2

  server_port = 8080
  elb_port    = 80
  image_id = "ami-03ef731cc103c9f09"
  role_arn = "arn:aws:iam::711433298525:role/AssumeRole"
  atlantis_user = "vaibhav"
  atlantis_repo_owner = "sparebank1"
  atlantis_repo_name = "terragrunt"
  atlantis_pull_num = "1"
}
