# AWS Eventbridge Terraform module

Terraform module to manage an AWS Eventbridge event bus.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.66.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.66.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_metric_alarm.count_messages_visible](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.deadletter_queue_present](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.max_messages_age](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_sqs_queue.eventbridge_dlq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.primary_dlq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_policy.eventbridge_dlq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |
| [aws_sqs_queue_policy.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |
| [aws_sqs_queue_redrive_allow_policy.queue_redrive](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_redrive_allow_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_sqs_fifo_queue"></a> [enable\_sqs\_fifo\_queue](#input\_enable\_sqs\_fifo\_queue) | Whether to enable the FIFO queue | `bool` | `false` | no |
| <a name="input_enable_sqs_redrive"></a> [enable\_sqs\_redrive](#input\_enable\_sqs\_redrive) | Enable the redrive policy for the queue | `bool` | `true` | no |
| <a name="input_event_bus_name"></a> [event\_bus\_name](#input\_event\_bus\_name) | The name of the event bus | `string` | n/a | yes |
| <a name="input_event_pattern"></a> [event\_pattern](#input\_event\_pattern) | The event pattern | `string` | n/a | yes |
| <a name="input_lambda_timeout"></a> [lambda\_timeout](#input\_lambda\_timeout) | The timeout for the lambda function in seconds | `number` | `30` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the queue | `string` | n/a | yes |
| <a name="input_rule_description"></a> [rule\_description](#input\_rule\_description) | The description of the rule | `string` | n/a | yes |
| <a name="input_sns_monitoring_arn"></a> [sns\_monitoring\_arn](#input\_sns\_monitoring\_arn) | The ARN of the SNS topic to send monitoring alerts to | `string` | `null` | no |
| <a name="input_sqs_fifo_content_based_deduplication"></a> [sqs\_fifo\_content\_based\_deduplication](#input\_sqs\_fifo\_content\_based\_deduplication) | Whether to enable content-based deduplication for the FIFO queue | `bool` | `false` | no |
| <a name="input_sqs_fifo_deduplication_scope"></a> [sqs\_fifo\_deduplication\_scope](#input\_sqs\_fifo\_deduplication\_scope) | The deduplication scope for the FIFO queue. Valid values are queue (default) and messageGroup. | `string` | `"queue"` | no |
| <a name="input_sqs_fifo_throughput_limit"></a> [sqs\_fifo\_throughput\_limit](#input\_sqs\_fifo\_throughput\_limit) | The throughput limit for the FIFO queue. Valid values are perQueue (default) and perMessageGroupId. | `string` | `"perQueue"` | no |
| <a name="input_sqs_max_receive_count"></a> [sqs\_max\_receive\_count](#input\_sqs\_max\_receive\_count) | The maximum number of times a message can be received before being sent to the dead letter queue | `number` | `10` | no |
| <a name="input_sqs_message_retention_seconds"></a> [sqs\_message\_retention\_seconds](#input\_sqs\_message\_retention\_seconds) | The number of seconds to retain a message in the queue | `number` | `345600` | no |
| <a name="input_sqs_messages_count_period"></a> [sqs\_messages\_count\_period](#input\_sqs\_messages\_count\_period) | The period in seconds for the number of messages in the queue | `number` | `60` | no |
| <a name="input_sqs_messages_count_threshold"></a> [sqs\_messages\_count\_threshold](#input\_sqs\_messages\_count\_threshold) | The threshold for the number of messages in the queue | `number` | `1` | no |
| <a name="input_sqs_messages_evaluation_periods"></a> [sqs\_messages\_evaluation\_periods](#input\_sqs\_messages\_evaluation\_periods) | n/a | `number` | `1` | no |
| <a name="input_sqs_oldest_message_threshold"></a> [sqs\_oldest\_message\_threshold](#input\_sqs\_oldest\_message\_threshold) | The threshold for the oldest message in seconds | `string` | `"60"` | no |
| <a name="input_sqs_receive_wait_time_seconds"></a> [sqs\_receive\_wait\_time\_seconds](#input\_sqs\_receive\_wait\_time\_seconds) | The time in seconds that the receive message call will wait for a message to arrive in the queue before returning | `number` | `20` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sqs_queue_arn"></a> [sqs\_queue\_arn](#output\_sqs\_queue\_arn) | The ARN of the SQS queue |
<!-- END_TF_DOCS -->