# terraform-aws-tgw-rt-association
This TF module knows which TGW RT to associate with your VPC (based on Hub &amp; Spoke model, with or without FW)

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
| [aws_ec2_transit_gateway_route.all_to_inspection_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route) | resource |
| [aws_ec2_transit_gateway_route.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route) | resource |
| [aws_ec2_transit_gateway_route.spoke_vpc_cidr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route) | resource |
| [aws_ec2_transit_gateway_route_table_association.hub_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table_association) | resource |
| [aws_ec2_transit_gateway_route_table_association.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table_association) | resource |
| [aws_ec2_transit_gateway_route_table_association.spoke_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_inspection"></a> [create\_inspection](#input\_create\_inspection) | Whether there is a Firewall in the environment | `bool` | n/a | yes |
| <a name="input_is_inspection"></a> [is\_inspection](#input\_is\_inspection) | Whether this VPC contains a Firewall or not. Should be true if the VPC contains a Firewall | `bool` | `false` | no |
| <a name="input_tgw_attach_id"></a> [tgw\_attach\_id](#input\_tgw\_attach\_id) | The id of the Transit Gateway Attachment | `string` | n/a | yes |
| <a name="input_tgw_hub_route_table_id"></a> [tgw\_hub\_route\_table\_id](#input\_tgw\_hub\_route\_table\_id) | The id of the TGW Route Table of the VPC that contain a Firewall | `string` | `null` | no |
| <a name="input_tgw_route_table_id"></a> [tgw\_route\_table\_id](#input\_tgw\_route\_table\_id) | The id of the TGW Route Table (in a single TGW RT deployment) | `string` | `null` | no |
| <a name="input_tgw_spoke_route_table_id"></a> [tgw\_spoke\_route\_table\_id](#input\_tgw\_spoke\_route\_table\_id) | The id of the TGW Route Table of all VPCs that don't contain a Firewall | `string` | `null` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The VPC CIDR Block in order to add it to the Route Table | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The VPC name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->