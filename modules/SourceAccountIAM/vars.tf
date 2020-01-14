variable "aws_region" {
  description = "AWS region"
}


variable "name" {
  description = "The name of the role. If omitted, Terraform will assign a random, unique name."
}

variable "path" {
  default     = "/"
  description = "Path in which to create the role and the policy."
}

variable "description" {
  default     = "Managed by Terraform"
  description = "The description of the role and the policy."
}

variable "max_session_duration" {
  default     = "3600"
  description = "The maximum session duration (in seconds) that you want to set for the specified role."
}

variable "force_detach_policies" {
  default     = false
  description = "Specifies to force detaching any policies the role has before destroying it."
}


variable "account_nember" {
  
}

variable "atlantis_user" {
  
}

variable "atlantis_repo_owner" {
  
}
variable "atlantis_repo_name" {
  
}

variable "atlantis_pull_num" {
  
}