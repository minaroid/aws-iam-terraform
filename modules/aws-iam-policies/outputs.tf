output "s3_admin_policy" {
  value = aws_iam_policy.s3-admin-policy
}

output "aws_administrator_access" {
  value = data.aws_iam_policy.aws_administrator_access
}
