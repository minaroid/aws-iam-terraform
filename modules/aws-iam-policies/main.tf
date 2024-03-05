resource "aws_iam_policy" "s3-admin-policy" {
  name        = "s3AdminPolicy"
  description = "S3 admin policy"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": "*"
    }
  ]
}
EOF
}


data "aws_iam_policy" "aws_administrator_access" {
    name = "AdministratorAccess"
}
