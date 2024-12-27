resource "aws_iam_openid_connect_provider" "oidc" {
  client_id_list  = [local.audience]
  thumbprint_list = [local.thumbprint]
  url             = "https://${local.oidc_provider_uri}"

  tags = {
    Name        = "bitbucket/github"
    Environment = local.environment
  }
}

resource "aws_iam_role" "pipelines_cd" {
  name                 = "pipelines-cd-${random_string.random.result}"
  assume_role_policy   = data.aws_iam_policy_document.oidc.json
  description          = "Role assumed by the Bitbucket/GitHub OIDC provider to perform Continuous Deployment workflows"
  max_session_duration = local.bb_runner_roles_max_session_duration

  tags = {
    Name        = "pipelines-cd-${random_string.random.result}"
    Environment = local.environment
  }
}

resource "aws_iam_role_policy_attachment" "pipelines_cd_permissions" {
  role       = aws_iam_role.pipelines_cd.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

data "aws_iam_policy_document" "oidc" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    principals {
      identifiers = [aws_iam_openid_connect_provider.oidc.arn]
      type        = "Federated"
    }

    condition {
      test     = "StringEquals"
      variable = "${local.oidc_provider_uri}:aud"
      values   = [local.audience]
    }

    # NOTE: Enable this when using GitHub
    # condition {
    #   test     = "StringLike"
    #   variable = "${local.oidc_provider_uri}:sub"
    #   values   = ["repo:${local.github_org}/*:ref:refs/heads/*"]
    # }
  }
}
