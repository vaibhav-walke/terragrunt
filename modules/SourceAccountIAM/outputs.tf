/* output "iam_role_arn" {
  value       = aws_iam_role.sourceaccountrole.arn
  description = "The Amazon Resource Name (ARN) specifying the role."
}

output "iam_role_create_date" {
  value       = aws_iam_role.sourceaccountrole.create_date
  description = "The creation date of the IAM role."
}

output "iam_role_unique_id" {
  value       = aws_iam_role.sourceaccountrole.unique_id
  description = "The stable and unique string identifying the role."
}

output "iam_role_name" {
  value       = aws_iam_role.sourceaccountrole.name
  description = "The name of the role."
}

output "iam_role_description" {
  value       = aws_iam_role.sourceaccountrole.description
  description = "The description of the role."
}

output "iam_policy_id" {
  value       = aws_iam_policy.sourceaccountrolepolicy.id
  description = "The policy's ID."
}

output "iam_policy_arn" {
  value       = aws_iam_policy.sourceaccountrolepolicy.arn
  description = "The ARN assigned by AWS to this policy."
}

output "iam_policy_description" {
  value       = aws_iam_policy.sourceaccountrolepolicy.description
  description = "The description of the policy."
}

output "iam_policy_name" {
  value       = aws_iam_policy.sourceaccountrolepolicy.name
  description = "The name of the policy."
}

output "iam_policy_path" {
  value       = aws_iam_policy.sourceaccountrolepolicy.path
  description = "The path of the policy in IAM."
}

output "iam_policy_document" {
  value       = aws_iam_policy.sourceaccountrolepolicy.policy
  description = "The policy document."
}
 */