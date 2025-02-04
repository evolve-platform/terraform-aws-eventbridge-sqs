variable "name" {
  type        = string
  description = "The name of the queue"
  validation {
    condition     = can(regex("[\\w-]*", var.name))
    error_message = "Name can only contain alphanumeric, underscore and dash characters."
  }
}

variable "event_bus_name" {
  type        = string
  description = "The name of the event bus"
}

variable "rule_description" {
  type        = string
  description = "The description of the rule"
}

variable "event_pattern" {
  type        = string
  description = "The event pattern"
}

variable "lambda_timeout" {
  type        = number
  default     = 30
  description = "The timeout for the lambda function in seconds"
}

variable "sns_monitoring_arn" {
  type        = string
  default     = null
  description = "The ARN of the SNS topic to send monitoring alerts to"
}

variable "sqs_oldest_message_threshold" {
  type        = number
  default     = 60
  description = "The threshold for the oldest message in seconds"
}

variable "sqs_oldest_message_evaluation_periods" {
  type        = number
  default     = 1
  description = "The number of evaluation periods for the oldest message alarm"
}

variable "sqs_oldest_message_period" {
  type        = number
  default     = 60
  description = "The period in seconds for the oldest message alarm"
}

variable "sqs_oldest_message_datapoints_to_alarm" {
  description = "The number of datapoints to evaluate for the alarm"
  type        = number
  default     = 1
}

variable "sqs_messages_count_threshold" {
  type        = number
  default     = 1
  description = "The threshold for the number of messages in the queue"
}

variable "sqs_messages_count_evaluation_periods" {
  type    = number
  default = 1
}

variable "sqs_messages_count_period" {
  type        = number
  default     = 60
  description = "The period in seconds for the number of messages in the queue"
}

variable "sqs_messages_count_datapoints_to_alarm" {
  description = "The number of datapoints to evaluate for the alarm"
  type        = number
  default     = 1
}

variable "sqs_receive_wait_time_seconds" {
  type        = number
  default     = 20
  description = "The time in seconds that the receive message call will wait for a message to arrive in the queue before returning"
}

variable "sqs_max_receive_count" {
  type        = number
  default     = 10
  description = "The maximum number of times a message can be received before being sent to the dead letter queue"
}

variable "sqs_message_retention_seconds" {
  type        = number
  default     = 345600
  description = "The number of seconds to retain a message in the queue"
}

variable "enable_sqs_redrive" {
  type        = bool
  default     = true
  description = "Enable the redrive policy for the queue"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "enable_sqs_fifo_queue" {
  type        = bool
  default     = false
  description = "Whether to enable the FIFO queue"
}

variable "sqs_fifo_throughput_limit" {
  type        = string
  default     = "perQueue"
  description = "The throughput limit for the FIFO queue. Valid values are perQueue (default) and perMessageGroupId."
}

variable "sqs_fifo_deduplication_scope" {
  type        = string
  default     = "queue"
  description = "The deduplication scope for the FIFO queue. Valid values are queue (default) and messageGroup."
}

variable "sqs_fifo_content_based_deduplication" {
  type        = bool
  default     = false
  description = "Whether to enable content-based deduplication for the FIFO queue"
}
