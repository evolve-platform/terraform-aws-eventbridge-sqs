variable "name" {
  type = string
  validation {
    condition     = can(regex("[\\w-]*", var.name))
    error_message = "Name can only contain alphanumeric, underscore and dash characters."
  }
}

variable "event_bus_name" {
  type = string
}

variable "rule_description" {
  type = string
}

variable "event_pattern" {
  type = string
}

variable "lambda_timeout" {
  type    = number
  default = 30
}

variable "sns_monitoring_arn" {
  type    = string
  default = null
}

variable "sqs_oldest_message_threshold" {
  type    = string
  default = "60"
}

variable "sqs_messages_count_threshold" {
  type    = number
  default = 1
}

variable "sqs_messages_count_period" {
  type    = number
  default = 60
}

variable "sqs_messages_evaluation_periods" {
  type    = number
  default = 1
}

variable "sqs_receive_wait_time_seconds" {
  type    = number
  default = 20
}

variable "sqs_max_receive_count" {
  type    = number
  default = 10
}

variable "sqs_message_retention_seconds" {
  type    = number
  default = 345600
}

variable "enable_sqs_redrive" {
  type    = bool
  default = true
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}
