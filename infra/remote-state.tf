# O cluster é criado pelo bunzina-infra; aqui só lemos o nome dele.
data "terraform_remote_state" "infra" {
  backend = "s3"

  config = {
    bucket = var.infra_state_bucket
    key    = var.infra_state_key
    region = var.aws_region
  }
}
