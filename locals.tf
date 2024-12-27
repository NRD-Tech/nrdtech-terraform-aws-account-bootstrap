######################################################################################################################################################
# Configuration for Bitbucket
# Documentation: https://support.atlassian.com/bitbucket-cloud/docs/deploy-on-aws-using-bitbucket-pipelines-openid-connect/
######################################################################################################################################################

# locals {
#   environment = "prod"

#   # Set the region your resources will be created in
#   region = "us-west-2"

#   # The value for oidc_provider_uri can be found under "Repository settings" -> "OpenID Connect" -> "Identity provider URL"
#   # in any Repository in your Bitbucket account
#   # NOTE: remove the "https://" from the front of the value
#   oidc_provider_uri = "api.bitbucket.org/2.0/workspaces/<my account name>/pipelines-config/identity/oidc"

#   # The value for oidc_provider_uri can be found under "Repository settings" -> "OpenID Connect" -> "Audience"
#   # in any Repository in your Bitbucket account
#   audience = "ari:cloud:bitbucket::workspace/<my id>"

#   # This value can be found on this web page: https://support.atlassian.com/bitbucket-cloud/docs/deploy-on-aws-using-bitbucket-pipelines-openid-connect/
#   thumbprint = "a031c46782e6e6c662c2c87c76da9aa62ccabd8e"

#   bb_runner_roles_max_session_duration = 3600 # 1 hour
# }


######################################################################################################################################################
# Configuration for GitHub
# Documentation: https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services
######################################################################################################################################################

# locals {
#   environment = "prod"

#   # Set the region your resources will be created in
#   region = "us-west-2"

#   # This value is the same for everyone
#   oidc_provider_uri = "token.actions.githubusercontent.com"

#   # This value is the same for everyone
#   audience = "sts.amazonaws.com"

#   # Generate this value by running this in bash: echo | openssl s_client -servername token.actions.githubusercontent.com -showcerts -connect token.actions.githubusercontent.com:443 2>/dev/null | openssl x509 -fingerprint -noout | awk -F= '{print $2}' | tr -d ':'
#   thumbprint = "<generate this>"

#   # Get this from your company's GitHub url
#   # Example: https://github.com/NRD-Tech/one-of-my-project-repositories
#   #    * In this example, "NRD-Tech" is the value you want for the github_org variable
#   github_org = "MyCompany"

#   bb_runner_roles_max_session_duration = 3600 # 1 hour
# }
