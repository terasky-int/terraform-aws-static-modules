<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_networkfirewall_firewall.network_firewall](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_firewall) | resource |
| [aws_networkfirewall_firewall_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_firewall_policy) | resource |
| [aws_networkfirewall_logging_configuration.anfw_logging_configuration_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_logging_configuration) | resource |
| [aws_networkfirewall_rule_group.domain_stateful_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_rule_group) | resource |
| [aws_networkfirewall_rule_group.fivetuple_stateful_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_rule_group) | resource |
| [aws_networkfirewall_rule_group.stateless_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_rule_group) | resource |
| [aws_networkfirewall_rule_group.suricata_stateful_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_rule_group) | resource |
| [aws_route.public_subnet_rt_to_igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.tgw_attachment_route_to_firewall_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_managed_rule_group"></a> [aws\_managed\_rule\_group](#input\_aws\_managed\_rule\_group) | List of AWS managed rule group arn | `list(any)` | `[]` | no |
| <a name="input_bucket_name_logging"></a> [bucket\_name\_logging](#input\_bucket\_name\_logging) | Name of s3 for logging | `string` | `""` | no |
| <a name="input_delete_protection"></a> [delete\_protection](#input\_delete\_protection) | A boolean flag indicating whether it is possible to delete the firewall. | `bool` | `false` | no |
| <a name="input_domain_stateful_rule_group"></a> [domain\_stateful\_rule\_group](#input\_domain\_stateful\_rule\_group) | "Config for domain type stateful rule group"<br>domain\_stateful\_rule\_group = [<br>  {<br>      capacity    = 100<br>      name        = "DOMAINSFEXAMPLE1"<br>      description = "Stateful rule example1 with domain list option"<br>      domain\_list = ["test.example.com", "test1.example.com"]<br>      actions     = "DENYLIST"<br>      protocols   = ["HTTP\_HOST", "TLS\_SNI"]<br>      rule\_variables = {<br>          ip\_sets = [{<br>              key    = "WEBSERVERS\_HOSTS"<br>              ip\_set = ["10.0.0.0/16", "10.0.1.0/24", "192.168.0.0/16"]<br>          },<br>          {<br>              key    = "EXTERNAL\_HOST"<br>              ip\_set = ["0.0.0.0/0"]<br>          }]<br>          port\_sets = [<br>          {<br>              key       = "HTTP\_PORTS"<br>              port\_sets = ["443", "80"]<br>          }]<br>      }<br>  }] | `any` | `[]` | no |
| <a name="input_firewall_name"></a> [firewall\_name](#input\_firewall\_name) | Network firewall name | `string` | `""` | no |
| <a name="input_firewall_policy_change_protection"></a> [firewall\_policy\_change\_protection](#input\_firewall\_policy\_change\_protection) | A boolean flag indicating whether it is possible to change the associated firewall policy. | `bool` | `false` | no |
| <a name="input_fivetuple_stateful_rule_group"></a> [fivetuple\_stateful\_rule\_group](#input\_fivetuple\_stateful\_rule\_group) | "Config for 5-tuple type stateful rule group"<br>fivetuple\_stateful\_rule\_group = [<br>      {<br>      capacity    = 100<br>      name        = "stateful"<br>      description = "Stateful rule example1 with 5 tuple option"<br>      rule\_config = [{<br>          description           = "Pass All Rule"<br>          protocol              = "TCP"<br>          source\_ipaddress      = "1.2.3.4/32"<br>          source\_port           = 443<br>          destination\_ipaddress = "124.1.1.5/32"<br>          destination\_port      = 443<br>          direction             = "any"<br>          sid                   = 1<br>          actions = {<br>          type = "pass"<br>          }<br>      }]<br>      },<br>  ] | `any` | `[]` | no |
| <a name="input_inspection_vpc_igw_id"></a> [inspection\_vpc\_igw\_id](#input\_inspection\_vpc\_igw\_id) | The IGW ID of isnepction vpc | `string` | `""` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | Policy name that attached to your network firewall | `string` | `""` | no |
| <a name="input_route_for_public_route_table_ids"></a> [route\_for\_public\_route\_table\_ids](#input\_route\_for\_public\_route\_table\_ids) | n/a | `list(string)` | `[]` | no |
| <a name="input_route_for_tgw_route_table_ids"></a> [route\_for\_tgw\_route\_table\_ids](#input\_route\_for\_tgw\_route\_table\_ids) | n/a | `list(string)` | `[]` | no |
| <a name="input_s3_logs_prefix"></a> [s3\_logs\_prefix](#input\_s3\_logs\_prefix) | n/a | `string` | `""` | no |
| <a name="input_stateless_default_actions"></a> [stateless\_default\_actions](#input\_stateless\_default\_actions) | Set of actions to take on a packet if it does not match any of the stateless rules in the policy. You must specify one of the standard actions including: `aws:drop`, `aws:pass`, or `aws:forward_to_sf`e. In addition, you can specify custom actions that are compatible with your standard action choice. If you want non-matching packets to be forwarded for stateful inspection, specify `aws:forward_to_sfe`. | `list(any)` | <pre>[<br>  "aws:forward_to_sfe"<br>]</pre> | no |
| <a name="input_stateless_fragment_default_actions"></a> [stateless\_fragment\_default\_actions](#input\_stateless\_fragment\_default\_actions) | Set of actions to take on a fragmented packet if it does not match any of the stateless rules in the policy. You must specify one of the standard actions including: `aws:drop`, `aws:pass`, or `aws:forward_to_sf`e. In addition, you can specify custom actions that are compatible with your standard action choice. If you want non-matching packets to be forwarded for stateful inspection, specify `aws:forward_to_sfe`. | `list(any)` | <pre>[<br>  "aws:forward_to_sfe"<br>]</pre> | no |
| <a name="input_stateless_rule_group"></a> [stateless\_rule\_group](#input\_stateless\_rule\_group) | "Config for stateless rule group"<br><br>  stateless\_rule\_group = [<br>      {<br>      capacity    = 100<br>      name        = "stateless"<br>      description = "Stateless rule example1"<br>      rule\_config = [{<br>          priority              = 1<br>          protocols\_number      = [6]<br>          source\_ipaddress      = "1.2.3.4/32"<br>          source\_from\_port      = 443<br>          source\_to\_port        = 443<br>          destination\_ipaddress = "124.1.1.5/32"<br>          destination\_from\_port = 443<br>          destination\_to\_port   = 443<br>          tcp\_flag = {<br>          flags = ["SYN"]<br>          masks = ["SYN", "ACK"]<br>          }<br>          actions = {<br>          type = "pass"<br>          }<br>      }]<br>      }] | `any` | `[]` | no |
| <a name="input_subnet_change_protection"></a> [subnet\_change\_protection](#input\_subnet\_change\_protection) | A boolean flag indicating whether it is possible to change the associated subnet(s). | `bool` | `false` | no |
| <a name="input_subnet_mapping"></a> [subnet\_mapping](#input\_subnet\_mapping) | Subnets map. Each subnet must belong to a different Availability Zone in the VPC. AWS Network Firewall creates a firewall endpoint in each subnet. | `list(string)` | `[]` | no |
| <a name="input_suricata_stateful_rule_group"></a> [suricata\_stateful\_rule\_group](#input\_suricata\_stateful\_rule\_group) | "Config for Suricata type stateful rule group"<br><br>suricata\_stateful\_rule\_group = [<br>    {<br>        capacity    = 100<br>        name        = "SURICTASFEXAMPLE1"<br>        description = "Stateful rule example1 with suricta type"<br>        rules\_file  = "./example.rules"<br>    }] | `any` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID of Inspection vpc | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Created Network Firewall ARN from network\_firewall module |
| <a name="output_attachment"></a> [attachment](#output\_attachment) | Created Network Firewall states |
| <a name="output_endpoint_ids"></a> [endpoint\_ids](#output\_endpoint\_ids) | n/a |
| <a name="output_id"></a> [id](#output\_id) | Created Network Firewall ID from network\_firewall module |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | Created Network Firewall subnet id |
| <a name="output_sync_states"></a> [sync\_states](#output\_sync\_states) | Created Network Firewall states |
<!-- END_TF_DOCS -->