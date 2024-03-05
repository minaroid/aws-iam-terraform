## Simple web server using terraform 

This Terraform repository provides infrastructure as code (IaC) for deploying a simple EC2 instance on AWS using a combination of remote and local modules. By leveraging Terraform's capabilities, this project streamlines the provisioning process, allowing for consistent and scalable infrastructure deployments with ease. 

## Installation

- Rename `terraform.tfvars.example` file to `terraform.tfvars` and change values depending on yours.
- Export `AWS_ACCESS_KEY_ID` & `AWS_SECRET_ACCESS_KEY` to your local system environment.
- Run `terraform init`  to initialize the dependencies and modules.
- Run `terraform validate`  to validate before applying.
- Run `terraform apply` to deploy the infrastructure to the AWS console.
- Once the deployment success the created instance public IP will be printed in the terminal, you can use it to access it from your browser.
- Run `ssh -i ~/.ssh/id_rsa ubuntu@PUBLIC_IP` to access the instance using SSH.

## Note 

- Date `latest-ubuntu-image` tested only on the `us-east-1` region only, you maybe change the filters depend on the region.
- Ensure to execute `terraform destroy` to dismantle the infrastructure, mitigating unnecessary AWS costs.
