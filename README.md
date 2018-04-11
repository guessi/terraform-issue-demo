# Demo for TerraForm Issue (Bug?)

## Step to Reproduce

    $ git clone https://github.com/guessi/terraform-issue-demo.git
    $ cd terraform-issue-demo
    $ terraform init
    $ terraform plan


## Error message
 
```
Error: module.dynamodb-table-test.aws_cloudwatch_metric_alarm.cloudwatch_alarm_read: alarm_actions: should be a list
```

## Issue Tracking

* https://github.com/hashicorp/terraform/issues
