provider "aws" {
  region = var.region
}

module "aws-iam-policies" {
   source = "./modules/aws-iam-policies"  
}

module "aws-iam-roles" {
   source = "./modules/aws-iam-roles"  
   depends_on = [module.aws-iam-policies]
   aws_iam_policies = module.aws-iam-policies  
}

module "aws-iam-groups" {
   source = "./modules/aws-iam-groups"
   depends_on = [module.aws-iam-policies]
   aws_iam_policies = module.aws-iam-policies  
}

module "aws-iam-users" {
   source = "./modules/aws-iam-users"
   depends_on = [module.aws-iam-policies, module.aws-iam-groups]
   aws_iam_groups = module.aws-iam-groups  
   aws_iam_policies = module.aws-iam-policies  
}
