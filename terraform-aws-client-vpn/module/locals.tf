locals {
  self_service_portal = var.enable_self_service_portal == true ? "enabled" : "disabled"
  vpn_client_name     = var.name
}
