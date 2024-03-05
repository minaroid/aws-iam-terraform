locals {
  developers_policy_arns = [
     var.aws_iam_policies.s3_admin_policy.arn
  ]

  admins_policy_arns = [
     var.aws_iam_policies.aws_administrator_access.arn,
  ]
}

// developers group
resource "aws_iam_group" "developers-group" {
  name = "developers-group"
}

resource "aws_iam_group_policy_attachment" "developers-group-attachment" {
  count      = length(local.developers_policy_arns)
  group      = aws_iam_group.developers-group.name
  policy_arn = local.developers_policy_arns[count.index]
}

// Admins group 
resource "aws_iam_group" "admins-group" {
  name = "admins-group"
}

resource "aws_iam_group_policy_attachment" "admins-group-attachment" {
  count      = length(local.admins_policy_arns)
  group      = aws_iam_group.admins-group.name
  policy_arn = local.admins_policy_arns[count.index]
}