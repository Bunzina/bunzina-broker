variable "aws_region" {
  description = "AWS region where the EKS cluster is running."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Base name used for resource tags."
  type        = string
  default     = "bunzina"
}

variable "infra_state_bucket" {
  description = "S3 bucket containing the Terraform state for bunzina-infra."
  type        = string
}

variable "infra_state_key" {
  description = "S3 key for the bunzina-infra Terraform state."
  type        = string
  default     = "bunzina/infra/dev/terraform.tfstate"
}

variable "rabbitmq_namespace" {
  description = "Kubernetes namespace do RabbitMQ. Deve diferir do namespace criado pelo bunzina-db."
  type        = string
  default     = "rabbitmq"
}

variable "rabbitmq_username" {
  description = "Usuário administrador do RabbitMQ usado pelos serviços."
  type        = string
  default     = "bunzina"
}

variable "rabbitmq_password" {
  description = "Senha do usuário do RabbitMQ. Sem default: vem de TF_VAR_rabbitmq_password (secret RABBITMQ_PASSWORD no GitHub Actions). A mesma senha vai na URL do secret RABBITMQ_URL de cada serviço."
  type        = string
  sensitive   = true

  validation {
    condition     = length(var.rabbitmq_password) >= 8
    error_message = "rabbitmq_password precisa ter ao menos 8 caracteres (defina TF_VAR_rabbitmq_password)."
  }
}

variable "rabbitmq_storage_size" {
  description = "Tamanho do volume do RabbitMQ."
  type        = string
  default     = "2Gi"
}

variable "rabbitmq_storage_class" {
  description = "StorageClass do volume do RabbitMQ. Vazio usa a padrão do cluster (a gp3 é criada pelo bunzina-db)."
  type        = string
  default     = ""
}
