# terraform-aws-update-inspection-rts
This TF module update the Inspection VPC Route Tables with the Firewall Endpoints (whether its AWS NFW or GWLB)

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route.inspection_private_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.inspection_public_rt_aws_fw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.inspection_public_rt_gwlb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.inspection_tgw_rt_aws_fw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.inspection_tgw_rt_gwlb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_fw_endpoint_ids"></a> [aws\_fw\_endpoint\_ids](#input\_aws\_fw\_endpoint\_ids) | List of the AWS Network Firewall Endpoints IDs | `list(string)` | `[]` | no |
| <a name="input_create_aws_fw"></a> [create\_aws\_fw](#input\_create\_aws\_fw) | Whether there is a AWS Network Firewall presented in the environment | `bool` | `false` | no |
| <a name="input_create_gwlb"></a> [create\_gwlb](#input\_create\_gwlb) | Whether there is a AWS Gateway Load Balancer presented in the environment | `bool` | `false` | no |
| <a name="input_gwlb_endpoint_ids"></a> [gwlb\_endpoint\_ids](#input\_gwlb\_endpoint\_ids) | List of the Gateway Load Balancer VPC Endpoints IDs | `list(string)` | `[]` | no |
| <a name="input_inspection_private_rt_ids"></a> [inspection\_private\_rt\_ids](#input\_inspection\_private\_rt\_ids) | List of the Inspection VPC Private Route Table IDs | `list(string)` | `[]` | no |
| <a name="input_inspection_public_rt_ids"></a> [inspection\_public\_rt\_ids](#input\_inspection\_public\_rt\_ids) | List of the Inspection VPC Public Route Table IDs | `list(string)` | `[]` | no |
| <a name="input_inspection_tgw_rt_ids"></a> [inspection\_tgw\_rt\_ids](#input\_inspection\_tgw\_rt\_ids) | List of the Inspection VPC TGW Route Table IDs | `list(string)` | `[]` | no |
| <a name="input_tgw_id"></a> [tgw\_id](#input\_tgw\_id) | The id of the TGW | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The VPC CIDR Block in order to add it to the Route Table | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->