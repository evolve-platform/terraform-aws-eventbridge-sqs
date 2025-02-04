output "sqs_queue_arn" {
  value       = aws_sqs_queue.primary.arn
  description = "The ARN of the SQS queue"
}
