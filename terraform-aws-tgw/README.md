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
| [aws_ec2_transit_gateway.tgw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway) | resource |
| [aws_ec2_transit_gateway_route_table.hub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table) | resource |
| [aws_ec2_transit_gateway_route_table.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table) | resource |
| [aws_ec2_transit_gateway_route_table.spoke](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_inspection"></a> [create\_inspection](#input\_create\_inspection) | Whether there is a Firewall in the environment | `bool` | n/a | yes |
| <a name="input_hub_rt_name"></a> [hub\_rt\_name](#input\_hub\_rt\_name) | The name of the Transit Gateway Hub Route Table | `string` | `"Hub-RT"` | no |
| <a name="input_hub_rt_tags"></a> [hub\_rt\_tags](#input\_hub\_rt\_tags) | Additional Transit Gateway Route Table tags | `map(string)` | `{}` | no |
| <a name="input_spoke_rt_name"></a> [spoke\_rt\_name](#input\_spoke\_rt\_name) | The name of the Transit Gateway Spoke Route Table | `string` | `"Spoke-RT"` | no |
| <a name="input_spoke_rt_tags"></a> [spoke\_rt\_tags](#input\_spoke\_rt\_tags) | Additional Transit Gateway Route Table tags | `map(string)` | `{}` | no |
| <a name="input_tgw_name"></a> [tgw\_name](#input\_tgw\_name) | The name of the Transit Gateway | `string` | `null` | no |
| <a name="input_tgw_rt_name"></a> [tgw\_rt\_name](#input\_tgw\_rt\_name) | The name of the Transit Gateway Route Table | `string` | `"TGW-RT"` | no |
| <a name="input_tgw_rt_tags"></a> [tgw\_rt\_tags](#input\_tgw\_rt\_tags) | Additional Transit Gateway Route Table tags | `map(string)` | `{}` | no |
| <a name="input_tgw_tags"></a> [tgw\_tags](#input\_tgw\_tags) | Transit gateway tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the Transit Gateway |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Transit Gateway |
| <a name="output_tgw_hub_route_table_arn"></a> [tgw\_hub\_route\_table\_arn](#output\_tgw\_hub\_route\_table\_arn) | The ARN of the Hub Route Table |
| <a name="output_tgw_hub_route_table_id"></a> [tgw\_hub\_route\_table\_id](#output\_tgw\_hub\_route\_table\_id) | The ID of the Hub Route Table |
| <a name="output_tgw_route_table_id"></a> [tgw\_route\_table\_id](#output\_tgw\_route\_table\_id) | The ID of the TGW Route Table (in a single TGW RT deployment) |
| <a name="output_tgw_spoke_route_table_arn"></a> [tgw\_spoke\_route\_table\_arn](#output\_tgw\_spoke\_route\_table\_arn) | The ARN of the Spoke Route Table |
| <a name="output_tgw_spoke_route_table_id"></a> [tgw\_spoke\_route\_table\_id](#output\_tgw\_spoke\_route\_table\_id) | The ID of the Spoke Route Table |
<!-- END_TF_DOCS -->