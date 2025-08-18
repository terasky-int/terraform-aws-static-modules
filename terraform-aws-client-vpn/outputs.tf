output "vpn_client_id" {
  description = "The VPN Cllient ID"
  value       = module.vpn_client_new.vpn_endpoint_id
}

output "security_group_id" {
  value = try(module.vpn_client_new.security_group_id, null)
}

output "vpn_client_cert" {
  description = "Cert of client certificate"
  value       = module.vpn_client_new.vpn_client_cert
  sensitive   = true
}
output "vpn_client_key" {
  description = "Key cert of client certificate"
  value       = module.vpn_client_new.vpn_client_key
  sensitive   = true
}
output "vpn_client_server_cert" {
  description = "Cert of server certificate"
  value       = module.vpn_client_new.vpn_client_server_cert
  sensitive   = true
}
output "vpn_client_server_key" {
  description = "Key cert of server certificate"
  value       = module.vpn_client_new.vpn_client_server_key
  sensitive   = true
}
output "vpn_client_ca_cert" {
  description = "Cert of ca certificate"
  value       = module.vpn_client_new.vpn_client_ca_cert
  sensitive   = true
}
output "vpn_client_ca_key" {
  description = "Key cert of ca certificate"
  value       = module.vpn_client_new.vpn_client_ca_key
  sensitive   = true
}

output "vpn_client_server_certificate_id" {
  description = "The ID of server certificate"
  value       = module.vpn_client_new.vpn_client_server_certificate_id
}

output "vpn_client_client_certificate_id" {
  description = "The ID of client cerififcate"
  value       = module.vpn_client_new.vpn_client_client_certificate_id
}

output "vpn_client_ca_certificate_id" {
  description = "The ID of ca certificate"
  value       = module.vpn_client_new.vpn_client_ca_certificate_id
}

