# Terraform Account Bootstrap

This repository contains Terraform HCL implementation to bootstrap an AWS account with resources required to manage and provision AWS resources with Bitbucket or GitHub pipelines.  The following resources are created:

- An AWS OpenID Connect Provider for Bitbucket/GitHub
- An AWS IAM Role with a trust policy for the OpenID Connect Provider
- Permissions for the AWS IAM Role to provision resources in the AWS Account
- An S3 bucket to use as a backend state destination

## Check Out Template
```
git clone git@bitbucket.org:nrd-tech/nrdtech-terraform-aws-account-bootstrap.git
cd tf-account-bootstrap
rm -fR .git
```

## Configuring

* Edit locals.tf
    * Un-comment either the Bitbucket or GitHub sections
    * Follow the instructions in locals.tf to set appropriate values for each variable
* If using GitHub
    * Edit oidc.tf and un-comment the extra condition in the aws_iam_policy_document.oidc data

## SSO
* If your account is using the SSO system you will need to do the following
1. Add access and secret credentials to ~/.aws/credentials
2. Add config to ~/.aws/config
```
[profile mycompanyname]
sso_session = mycompanyname
sso_account_id = 1234567890 # account id
sso_role_name = AdministratorAccess
region = us-east-1
output = json

[sso-session mycompanyname]
sso_start_url = https://d-123456.awsapps.com/start/#
sso_region = us-east-1
sso_registration_scopes = sso:account:access
```
3. `aws sso login --profile mycompanyname`

## Applying

* Use a bootstrap AWS IAM User or your AWS IAM Identity Center SSO credentials to initially apply this repo.  
* It is recommended to run the following commands inside the devcontainer for this project

To apply:

```
# Set AWS credentials to account you are bootstrapping, for example:
export AWS_PROFILE=<your company aws profile>

# Run Terraform
terraform init
terraform plan -out plan.out
terraform apply plan.out
```

* Take note and save the Outputs. These values will be used in all future projects.
```
pipelines_cd_role_arn = "arn:aws:iam::1234567890:role/pipelines-cd-abc123"
terraform_state_bucket = "terraform-state-abc123"
```

## Store the state file in git
```
git add .
git commit -a -m 'added state file'
git push
```

## Usage

The outputs of this Terraform are intended to be used in other Bitbucket or GitHub git repositories.
The `pipelines_cd_role_arn` and `terraform_state_bucket` will be set in the project configuration files.
