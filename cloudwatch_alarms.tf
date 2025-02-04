locals {
  alarm_actions = var.sns_monitoring_arn == null ? [] : [var.sns_monitoring_arn]
  ok_actions    = var.sns_monitoring_arn == null ? [] : [var.sns_monitoring_arn]
}

resource "aws_cloudwatch_metric_alarm" "count_messages_visible" {
  alarm_name        = "${aws_sqs_queue.primary.name}-messages-visible"
  alarm_description = <<EOF
The queue ${aws_sqs_queue.primary.name} contains too many messages.
EOF
  tags              = var.tags

  namespace          = "AWS/SQS"
  metric_name        = "ApproximateNumberOfMessagesVisible"
  statistic          = "Maximum"
  treat_missing_data = "notBreaching"

  alarm_actions = local.alarm_actions
  ok_actions    = local.ok_actions

  dimensions = {
    QueueName = aws_sqs_queue.primary.name
  }

  comparison_operator = "GreaterThanOrEqualToThreshold"
  threshold           = var.sqs_messages_count_threshold
  period              = var.sqs_messages_count_period
  evaluation_periods  = var.sqs_messages_count_evaluation_periods
  datapoints_to_alarm = var.sqs_messages_count_datapoints_to_alarm
}

# Checks each minute if the queue contains messages older than the threshold
resource "aws_cloudwatch_metric_alarm" "max_messages_age" {
  alarm_name = "${aws_sqs_queue.primary.name}-maximum-message-age"

  alarm_description = <<EOF
The queue ${aws_sqs_queue.primary.name} contains a message that exists longer the threshold.
EOF
  tags              = var.tags

  namespace          = "AWS/SQS"
  metric_name        = "ApproximateAgeOfOldestMessage"
  statistic          = "Maximum"
  treat_missing_data = "notBreaching"

  alarm_actions = local.alarm_actions
  ok_actions    = local.ok_actions

  dimensions = {
    QueueName = aws_sqs_queue.primary.name
  }

  comparison_operator = "GreaterThanOrEqualToThreshold"
  threshold           = var.sqs_oldest_message_threshold
  period              = var.sqs_oldest_message_period
  evaluation_periods  = var.sqs_oldest_message_evaluation_periods
  datapoints_to_alarm = var.sqs_oldest_message_datapoints_to_alarm
}

resource "aws_cloudwatch_metric_alarm" "deadletter_queue_present" {
  alarm_name = "${aws_sqs_queue.primary_dlq.name}-messages-present"

  alarm_description = <<EOF
The queue ${aws_sqs_queue.primary_dlq.name} contains messages.
EOF
  tags              = var.tags


  namespace          = "AWS/SQS"
  metric_name        = "ApproximateNumberOfMessagesVisible"
  statistic          = "Minimum"
  treat_missing_data = "notBreaching"

  alarm_actions = local.alarm_actions
  ok_actions    = local.ok_actions

  dimensions = {
    QueueName = aws_sqs_queue.primary_dlq.name
  }

  comparison_operator = "GreaterThanOrEqualToThreshold"
  threshold           = "1"
  period              = 60
  evaluation_periods  = 1
}
