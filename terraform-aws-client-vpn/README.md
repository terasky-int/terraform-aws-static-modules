## Terraform-AWS-Client-VPN
This module creates th resources for aws vpn client in aws landing zine

# Get Started

```hcl
destination_cidr_block = [""] # In order to filter static routes to specific cidr blocks please provide lis of cidr blocks, else it will allow all.
allowed_access_groups = [""] # If you want to authorize specific security groups that allowed to use AWS VPN Client provie list of group IDs else it will allow all.
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | = 4.0.5 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpn_client_new"></a> [vpn\_client\_new](#module\_vpn\_client\_new) | ./module | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | The AWS account name | `string` | n/a | yes |
| <a name="input_active_directory_id"></a> [active\_directory\_id](#input\_active\_directory\_id) | Provide AD Directory ID | `string` | `""` | no |
| <a name="input_allowed_access_groups"></a> [allowed\_access\_groups](#input\_allowed\_access\_groups) | List of Access group IDs to allow access. Leave empty to allow all groups | `list(string)` | `[]` | no |
| <a name="input_allowed_cidr_ranges"></a> [allowed\_cidr\_ranges](#input\_allowed\_cidr\_ranges) | List of CIDR ranges from which access is allowed | `list(string)` | `[]` | no |
| <a name="input_assume_role_name"></a> [assume\_role\_name](#input\_assume\_role\_name) | ARN of an IAM Role to assume | `string` | `"TerraformExecutionRole"` | no |
| <a name="input_authentication_saml_provider_arn"></a> [authentication\_saml\_provider\_arn](#input\_authentication\_saml\_provider\_arn) | (Optional) The ARN of the IAM SAML identity provider if type is federated-authentication. | `string` | `null` | no |
| <a name="input_aws_account"></a> [aws\_account](#input\_aws\_account) | AWS account ID to assume the IAM role in | `string` | n/a | yes |
| <a name="input_aws_account_log_archived"></a> [aws\_account\_log\_archived](#input\_aws\_account\_log\_archived) | AWS account ID to assume the IAM role in | `string` | `""` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Name of the AWS region | `string` | n/a | yes |
| <a name="input_destination_cidr_block"></a> [destination\_cidr\_block](#input\_destination\_cidr\_block) | Provide list of cidr destination route rules to create | `list(string)` | `[]` | no |
| <a name="input_enable_self_service_portal"></a> [enable\_self\_service\_portal](#input\_enable\_self\_service\_portal) | Specify whether to enable the self-service portal for the Client VPN endpoint | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of the environment this resource is part of. Valid values include `dev`, `test`, `poc`, `prod`, `shared-services` | `string` | n/a | yes |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | Provide Security Groups IDs to assign to AWS VPN Client | `string` | `""` | no |
| <a name="input_self_service_saml_provider_arn"></a> [self\_service\_saml\_provider\_arn](#input\_self\_service\_saml\_provider\_arn) | The ARN of the IAM SAML identity provider for self-service portal | `string` | `""` | no |
| <a name="input_vpn_client_authentication_type"></a> [vpn\_client\_authentication\_type](#input\_vpn\_client\_authentication\_type) | Authentication type for VPN Clients the default is certificate authentication, for using AD authentication use 'directory-service-authentication' | `string` | `"certificate-authentication"` | no |
| <a name="input_vpn_client_cert_list"></a> [vpn\_client\_cert\_list](#input\_vpn\_client\_cert\_list) | The list of name client certs that must be created for example:<br>["name-of-client cert"] | `list(string)` | `[]` | no |
| <a name="input_vpn_client_cidr"></a> [vpn\_client\_cidr](#input\_vpn\_client\_cidr) | CIDR for VPN client connections this CIDR must be not overlopped with aws or on-premises private CIDRs | `string` | `""` | no |
| <a name="input_vpn_client_logs_retention"></a> [vpn\_client\_logs\_retention](#input\_vpn\_client\_logs\_retention) | Retention days for logs by default 365 | `number` | `365` | no |
| <a name="input_vpn_client_name"></a> [vpn\_client\_name](#input\_vpn\_client\_name) | Name of VPN Client | `string` | `""` | no |
| <a name="input_vpn_client_organization_name_certificate"></a> [vpn\_client\_organization\_name\_certificate](#input\_vpn\_client\_organization\_name\_certificate) | Name of the organization for vpn client cetificate | `string` | `""` | no |
| <a name="input_vpn_client_port"></a> [vpn\_client\_port](#input\_vpn\_client\_port) | Choose port for vpn client 443 or 1194 | `number` | `1194` | no |
| <a name="input_vpn_client_split_tunnel"></a> [vpn\_client\_split\_tunnel](#input\_vpn\_client\_split\_tunnel) | Split tunnel for vpn client connections by default true | `bool` | `true` | no |
| <a name="input_vpn_client_subnets"></a> [vpn\_client\_subnets](#input\_vpn\_client\_subnets) | Provide Subnet IDS for creation AWS VPN CLient | `list(string)` | `[]` | no |
| <a name="input_vpn_client_vpc_id"></a> [vpn\_client\_vpc\_id](#input\_vpn\_client\_vpc\_id) | Provide VPC ID which AWS VPN Client will be created | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | n/a |
| <a name="output_vpn_client_ca_cert"></a> [vpn\_client\_ca\_cert](#output\_vpn\_client\_ca\_cert) | Cert of ca certificate |
| <a name="output_vpn_client_ca_certificate_id"></a> [vpn\_client\_ca\_certificate\_id](#output\_vpn\_client\_ca\_certificate\_id) | The ID of ca certificate |
| <a name="output_vpn_client_ca_key"></a> [vpn\_client\_ca\_key](#output\_vpn\_client\_ca\_key) | Key cert of ca certificate |
| <a name="output_vpn_client_cert"></a> [vpn\_client\_cert](#output\_vpn\_client\_cert) | Cert of client certificate |
| <a name="output_vpn_client_client_certificate_id"></a> [vpn\_client\_client\_certificate\_id](#output\_vpn\_client\_client\_certificate\_id) | The ID of client cerififcate |
| <a name="output_vpn_client_id"></a> [vpn\_client\_id](#output\_vpn\_client\_id) | The VPN Cllient ID |
| <a name="output_vpn_client_key"></a> [vpn\_client\_key](#output\_vpn\_client\_key) | Key cert of client certificate |
| <a name="output_vpn_client_server_cert"></a> [vpn\_client\_server\_cert](#output\_vpn\_client\_server\_cert) | Cert of server certificate |
| <a name="output_vpn_client_server_certificate_id"></a> [vpn\_client\_server\_certificate\_id](#output\_vpn\_client\_server\_certificate\_id) | The ID of server certificate |
| <a name="output_vpn_client_server_key"></a> [vpn\_client\_server\_key](#output\_vpn\_client\_server\_key) | Key cert of server certificate |
<!-- END_TF_DOCS -->