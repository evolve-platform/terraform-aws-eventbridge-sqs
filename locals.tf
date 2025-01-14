data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  queue_name      = var.name
  dlq_name        = "${var.name}-dlq"
  eb_dlq_name     = "${var.name}-eb-dlq"
  aws_account_id  = data.aws_caller_identity.current.account_id
  aws_region_name = data.aws_region.current.name
}
