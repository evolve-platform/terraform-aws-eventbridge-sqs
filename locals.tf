locals {
  queue_name = var.name
  dlq_name   = "${var.name}-dlq"
}
