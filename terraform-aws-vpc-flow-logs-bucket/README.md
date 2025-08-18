# terraform-aws-vpc-flow-logs-bucket
This TF module creating a centralized S3 Bucket for VPC Flow Logs with appropriate policy. The bucket supposed to be stored in the Log Archive account 

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_bucket_for_vpc_flow_logs"></a> [s3\_bucket\_for\_vpc\_flow\_logs](#module\_s3\_bucket\_for\_vpc\_flow\_logs) | terraform-aws-modules/s3-bucket/aws | 3.8.2 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_name"></a> [assume\_role\_name](#input\_assume\_role\_name) | ARN of an IAM Role to assume | `string` | n/a | yes |
| <a name="input_aws_account"></a> [aws\_account](#input\_aws\_account) | AWS account ID to assume the IAM role in | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Name of the AWS region | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of the environment this resource is part of. Valid values include `security` | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags for the S3 bucket | `map(any)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->