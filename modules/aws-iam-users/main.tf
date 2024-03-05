// Admin
resource "aws_iam_user" "admin_user" {
  name = "admin"
  force_destroy     = false
}

resource "aws_iam_user_group_membership" "admin_membership" {
  user    = aws_iam_user.admin_user.name
  groups  = [var.aws_iam_groups.admins_group.name]
}

//  Pop
resource "aws_iam_user" "pop_user" {
  name = "pop"
  force_destroy     = true
}

resource "aws_iam_user_group_membership" "pop_membership" {
  user    = aws_iam_user.pop_user.name
  groups  = [var.aws_iam_groups.developers_group.name]
}
