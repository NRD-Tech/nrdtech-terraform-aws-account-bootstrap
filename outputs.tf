output "pipelines_cd_role_arn" {
  value = aws_iam_role.pipelines_cd.arn
}

output "terraform_state_bucket" {
  value = aws_s3_bucket.terraform_state.id
}
