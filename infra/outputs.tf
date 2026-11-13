output "rabbitmq_namespace" {
  description = "Namespace onde o RabbitMQ roda."
  value       = helm_release.rabbitmq.namespace
}

output "rabbitmq_amqp_host" {
  description = "Host AMQP dentro do cluster (porta 5672). Monte o RABBITMQ_URL como amqp://<usuario>:<senha>@<host>:5672."
  value       = "${helm_release.rabbitmq.name}.${helm_release.rabbitmq.namespace}.svc.cluster.local"
}
