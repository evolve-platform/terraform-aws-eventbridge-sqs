resource "aws_cloudwatch_event_rule" "primary" {
  name           = var.name
  tags           = var.tags
  event_bus_name = var.event_bus_name
  description    = var.rule_description
  event_pattern  = var.event_pattern
}

resource "aws_cloudwatch_event_target" "primary" {
  rule           = aws_cloudwatch_event_rule.primary.name
  event_bus_name = var.event_bus_name

  dynamic "sqs_target" {
    for_each = var.enable_sqs_fifo_queue ? [1] : []
    content {
      message_group_id = "main"
    }
  }

  arn = aws_sqs_queue.primary.arn

  dead_letter_config {
    arn = aws_sqs_queue.eventbridge_dlq.arn
  }
}
