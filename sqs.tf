
resource "aws_sqs_queue" "primary" {
  name                      = var.name
  tags                      = var.tags
  receive_wait_time_seconds = var.sqs_receive_wait_time_seconds
  message_retention_seconds = var.sqs_message_retention_seconds

  redrive_policy = var.enable_sqs_redrive ? jsonencode({
    deadLetterTargetArn = aws_sqs_queue.primary_dlq.arn
    maxReceiveCount     = var.sqs_max_receive_count
  }) : null

  # should match lambda timeout
  visibility_timeout_seconds = var.lambda_timeout
}

resource "aws_sqs_queue_policy" "primary" {
  queue_url = aws_sqs_queue.primary.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "sqs:SendMessage",
        Resource  = aws_sqs_queue.primary.arn,
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = aws_cloudwatch_event_rule.primary.arn
          }
        }
      }
    ]
  })
}

resource "aws_sqs_queue" "primary_dlq" {
  name = "${var.name}-dlq"
  tags = var.tags
}

# SQS dlq redrive policy
resource "aws_sqs_queue_redrive_allow_policy" "queue_redrive" {
  queue_url = aws_sqs_queue.primary_dlq.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.primary.arn]
  })
}


resource "aws_sqs_queue" "eventbridge_dlq" {
  name = "${var.name}-eventbridge-dlq"
  tags = var.tags
}

resource "aws_sqs_queue_policy" "eventbridge_dlq" {
  queue_url = aws_sqs_queue.eventbridge_dlq.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "Dead-letter queue permissions",
        Action = "sqs:SendMessage",
        Effect = "Allow",
        Principal = {
          Service = "events.amazonaws.com"
        },
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = aws_cloudwatch_event_rule.primary.arn
          }
        }
      }
    ]
  })
}
