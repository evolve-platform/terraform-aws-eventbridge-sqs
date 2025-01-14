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
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_sqs_redrive"></a> [enable\_sqs\_redrive](#input\_enable\_sqs\_redrive) | n/a | `bool` | `true` | no |
| <a name="input_event_bus_name"></a> [event\_bus\_name](#input\_event\_bus\_name) | n/a | `string` | n/a | yes |
| <a name="input_event_pattern"></a> [event\_pattern](#input\_event\_pattern) | n/a | `string` | n/a | yes |
| <a name="input_lambda_timeout"></a> [lambda\_timeout](#input\_lambda\_timeout) | n/a | `number` | `30` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_rule_description"></a> [rule\_description](#input\_rule\_description) | n/a | `string` | n/a | yes |
| <a name="input_sns_monitoring_arn"></a> [sns\_monitoring\_arn](#input\_sns\_monitoring\_arn) | n/a | `string` | `null` | no |
| <a name="input_sqs_max_receive_count"></a> [sqs\_max\_receive\_count](#input\_sqs\_max\_receive\_count) | n/a | `number` | `10` | no |
| <a name="input_sqs_message_retention_seconds"></a> [sqs\_message\_retention\_seconds](#input\_sqs\_message\_retention\_seconds) | n/a | `number` | `345600` | no |
| <a name="input_sqs_messages_count_period"></a> [sqs\_messages\_count\_period](#input\_sqs\_messages\_count\_period) | n/a | `number` | `60` | no |
| <a name="input_sqs_messages_count_threshold"></a> [sqs\_messages\_count\_threshold](#input\_sqs\_messages\_count\_threshold) | n/a | `number` | `1` | no |
| <a name="input_sqs_oldest_message_threshold"></a> [sqs\_oldest\_message\_threshold](#input\_sqs\_oldest\_message\_threshold) | n/a | `string` | `"60"` | no |
| <a name="input_sqs_receive_wait_time_seconds"></a> [sqs\_receive\_wait\_time\_seconds](#input\_sqs\_receive\_wait\_time\_seconds) | n/a | `number` | `20` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sqs_queue_arn"></a> [sqs\_queue\_arn](#output\_sqs\_queue\_arn) | n/a |
<!-- END_TF_DOCS -->