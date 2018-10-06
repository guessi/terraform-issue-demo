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

* https://github.com/hashicorp/terraform/issues/17837
* https://github.com/hashicorp/terraform/issues/16916
* https://github.com/hashicorp/terraform/issues/16831
* https://github.com/terraform-providers/terraform-provider-aws/issues/5037#issuecomment-401836797
* https://github.com/terraform-providers/terraform-provider-aws/issues/1066#issuecomment-402218437
* https://github.com/terraform-providers/terraform-provider-aws/issues/5315#issuecomment-407744760
