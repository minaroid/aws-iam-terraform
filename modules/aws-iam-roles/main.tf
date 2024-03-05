
locals {
  ec2_policy_arns = [
     var.aws_iam_policies.s3_admin_policy.arn
  ]
}

// EC2 roles
resource "aws_iam_role" "ec2-s3-admin-role" {
  name        = "Ec2s3AdminRole"
  description = "Ec2 S3 admin role"
  assume_role_policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": ["ec2.amazonaws.com"]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ec2-s3-role-attachment" {
  count      = length(local.ec2_policy_arns)
  role       = aws_iam_role.ec2-s3-admin-role.name
  policy_arn = local.ec2_policy_arns[count.index] 
}