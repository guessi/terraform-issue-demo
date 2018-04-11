variable "sns_topic_name_alarm" {
  type        = "list"
  description = "SNS topic for Alarm"
  default     = []
}

resource "aws_dynamodb_table" "dynamodb_table" {
  name           = "dynamodb_test"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "pk"

  # table attributes
  attribute {
    name = "pk"
    type = "S"
  }

  # tag
  tags {
    TerraForm = "true"
  }
}

resource "aws_cloudwatch_metric_alarm" "cloudwatch_alarm_read" {
  alarm_name          = "AccountAccountsConsumedReadLow"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 10
  metric_name         = "ConsumedReadCapacityUnits"
  namespace           = "AWS/DynamoDB"
  period              = 60
  statistic           = "Sum"
  threshold           = 60

  alarm_actions = "${var.sns_topic_name_alarm}"
}
