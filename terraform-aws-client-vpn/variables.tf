################################################################################
# Global Variables
################################################################################
variable "aws_region" {
  description = "Name of the AWS region"
  type        = string
}

variable "aws_account" {
  description = "AWS account ID to assume the IAM role in"
  type        = string
}

variable "aws_account_log_archived" {
  description = "AWS account ID to assume the IAM role in"
  type        = string
  default     = ""
}

variable "assume_role_name" {
  description = "ARN of an IAM Role to assume"
  type        = string
  default     = "TerraformExecutionRole"
}

variable "environment" {
  description = "Name of the environment this resource is part of. Valid values include `dev`, `test`, `poc`, `prod`, `shared-services`"
  type        = string

  validation {
    condition     = contains(["dev", "blueprint", "test", "poc", "prod", "Shared-Services"], var.environment)
    error_message = "The value for \"environment\" must be one of the following: \"dev\"/\"test\"/\"poc\"/\"prod\"/\"shared-services\"/ (case-sensitive)"
  }
}

variable "account_name" {
  description = "The AWS account name"
  type        = string
}

################################################################################
# AWS VPN Client Variables
################################################################################
variable "vpn_client_organization_name_certificate" {
  description = "Name of the organization for vpn client cetificate"
  type        = string
  default     = ""
}

variable "vpn_client_cidr" {
  description = "CIDR for VPN client connections this CIDR must be not overlopped with aws or on-premises private CIDRs"
  type        = string
  default     = ""
}

variable "vpn_client_authentication_type" {
  description = "Authentication type for VPN Clients the default is certificate authentication, for using AD authentication use 'directory-service-authentication' "
  type        = string
  default     = "certificate-authentication"

}

variable "vpn_client_logs_retention" {
  description = "Retention days for logs by default 365"
  type        = number
  default     = 365
}

variable "vpn_client_name" {
  description = "Name of VPN Client"
  type        = string
  default     = ""
}

variable "vpn_client_split_tunnel" {
  default     = true
  type        = bool
  description = "Split tunnel for vpn client connections by default true"
}

variable "vpn_client_port" {
  type        = number
  description = "Choose port for vpn client 443 or 1194"
  default     = 1194
}

variable "vpn_client_cert_list" {
  description = <<-EOF
  The list of name client certs that must be created for example:
  ["name-of-client cert"] 
  EOF
  type        = list(string)
  default     = []
}

variable "vpn_client_vpc_id" {
  description = "Provide VPC ID which AWS VPN Client will be created"
  type        = string
  default     = ""
}

variable "vpn_client_subnets" {
  description = "Provide Subnet IDS for creation AWS VPN CLient"
  type        = list(string)
  default     = []
}

variable "active_directory_id" {
  description = "Provide AD Directory ID"
  type        = string
  default     = ""
}

variable "allowed_cidr_ranges" {
  type        = list(string)
  description = "List of CIDR ranges from which access is allowed"
  default     = []
}

variable "allowed_access_groups" {
  type        = list(string)
  description = "List of Access group IDs to allow access. Leave empty to allow all groups"
  default     = []
}

variable "destination_cidr_block" {
  description = "Provide list of cidr destination route rules to create"
  type        = list(string)
  default     = []
}

variable "security_group_id" {
  description = "Provide Security Groups IDs to assign to AWS VPN Client"
  type        = string
  default     = ""
}

variable "authentication_saml_provider_arn" {
  description = "(Optional) The ARN of the IAM SAML identity provider if type is federated-authentication."
  type        = string
  default     = null
}

variable "enable_self_service_portal" {
  type        = bool
  default     = false
  description = "Specify whether to enable the self-service portal for the Client VPN endpoint"
}

variable "self_service_saml_provider_arn" {
  description = "The ARN of the IAM SAML identity provider for self-service portal"
  type        = string
  default     = ""
}
