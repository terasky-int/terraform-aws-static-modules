variable "security_group_ids" {
  description = "Provide Security Groups IDs to assign to AWS VPN Client"
  type        = list(string)
  default     = []
}
variable "name" {
  description = "Name prefix for the resources of this stack"
  type        = string
  default     = ""
}

variable "cidr" {
  description = "Network CIDR to use for clients"
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "Subnet ID to associate clients (each subnet passed will create an VPN association - costs involved)"
  type        = list(string)
  default     = []
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

variable "vpc_id" {
  description = "VPC Id to create resources"
  type        = string
  default     = ""
}

variable "dns_servers" {
  type        = list(string)
  default     = []
  description = "List of DNS Servers"
}

variable "organization_name" {
  description = "Name of organization to use in private certificate"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Extra tags to attach to resources"
  type        = map(string)
  default     = {}
}

variable "logs_retention" {
  description = "Retention in days for CloudWatch Log Group"
  type        = number
  default     = 365

}

variable "authentication_type" {
  description = "The type of client authentication to be used. Specify certificate-authentication to use certificate-based authentication, directory-service-authentication to use Active Directory authentication, or federated-authentication to use Federated Authentication via SAML 2.0."
  type        = string
  default     = ""

}

variable "authentication_saml_provider_arn" {
  default     = null
  description = "(Optional) The ARN of the IAM SAML identity provider if type is federated-authentication."
}

variable "split_tunnel" {
  description = "With split_tunnel false, all client traffic will go through the VPN."
  type        = string
  default     = true

}

variable "security_group_id" {
  description = "Optional security group id to use instead of the default created"
  type        = string
  default     = ""
}

variable "enable_self_service_portal" {
  type        = bool
  default     = false
  description = "Specify whether to enable the self-service portal for the Client VPN endpoint"
}

variable "vpn_client_port" {
  description = "Choose port 443 or 1194"
  type        = number
  default     = 0
}

variable "vpn_client_cert_list" {
  description = "The list of name client certs that must be created"
  type        = list(string)
  default     = []
}

variable "active_directory_id" {
  description = "Provide AD Directory ID"
  type        = string
  default     = ""
}

variable "description" {
  description = "Provide description for AWS VPN Client"
  type        = string
  default     = ""
}

variable "destination_cidr_block" {
  description = "Provide list of cidr destination route rules to create"
  type        = list(string)
  default     = []
}

variable "self_service_saml_provider_arn" {
  description = "The ARN of the IAM SAML identity provider for self-service portal"
  type        = string
  default     = ""
}
