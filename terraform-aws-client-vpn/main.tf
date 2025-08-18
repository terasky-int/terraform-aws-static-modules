locals {
  vpn_client_name        = "${var.environment}-${var.account_name}-${var.vpn_client_name}-VPN-Client"
  vpn_client_description = "${local.vpn_client_name} - Managed By Terraform"

}
module "vpn_client_new" {
  source = "./module"

  # create certificates
  organization_name    = var.vpn_client_organization_name_certificate
  vpn_client_cert_list = var.vpn_client_cert_list

  name                             = local.vpn_client_name
  description                      = local.vpn_client_description
  authentication_type              = var.vpn_client_authentication_type
  cidr                             = var.vpn_client_cidr
  logs_retention                   = var.vpn_client_logs_retention
  subnet_ids                       = var.vpn_client_subnets
  vpc_id                           = var.vpn_client_vpc_id
  split_tunnel                     = var.vpn_client_split_tunnel
  vpn_client_port                  = var.vpn_client_port
  active_directory_id              = var.active_directory_id
  allowed_access_groups            = var.allowed_access_groups
  allowed_cidr_ranges              = var.allowed_cidr_ranges
  destination_cidr_block           = var.destination_cidr_block
  security_group_id                = var.security_group_id
  authentication_saml_provider_arn = var.authentication_saml_provider_arn
  enable_self_service_portal       = var.enable_self_service_portal
  self_service_saml_provider_arn   = var.self_service_saml_provider_arn

}
