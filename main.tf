terraform {
  required_version = ">= 0.11.6"
}

provider "null" {
  version = "~> 1.0"
}

provider "aws" {
  version = "~> 1.13"

  region  = "ap-northeast-1"
  profile = "personal"
}

data "aws_caller_identity" "current" {}

resource "aws_sns_topic" "sns-topic-test" {
  name = "sns-topic-test"
}

resource "null_resource" "example" {
  triggers = {
    json = "arn:aws:sns:ap-northeast-1:${data.aws_caller_identity.current.account_id}:sns-topic-test"
  }
}

module "dynamodb-table-test" {
  source = "./modules/demo"

  # SNS
  sns_topic_name_alarm = [
    "arn:aws:sns:ap-northeast-1:0123456789:sns-topic-test",

    # terraform will emit error message if the following line exist
    #
    # - Error: module.dynamodb-table-test.aws_cloudwatch_metric_alarm.cloudwatch_alarm_read: alarm_actions: should be a list
    #
    "arn:aws:sns:ap-northeast-1:${data.aws_caller_identity.current.account_id}:sns-topic-test",
  ]
}
