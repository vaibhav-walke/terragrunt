# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "../../../../web-server-modules/"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  name          = "webserver-example-qa"
  instance_type = "t2.micro"

  min_size = 2
  max_size = 2

  server_port = 8080
  elb_port    = 80
}