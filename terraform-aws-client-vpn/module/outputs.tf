output "security_group_id" {
  value = try(aws_security_group.default[0].id, var.security_group_id)
}
output "vpn_endpoint_id" {
  description = "The ID of vpn endpoint created"
  value       = aws_ec2_client_vpn_endpoint.default.id
}
output "vpn_client_cert" {
  description = "Cert of client certificate"
  value       = tls_locally_signed_cert.client[*].cert_pem
  sensitive   = true
}
output "vpn_client_key" {
  description = "Key cert of client certificate"
  value       = tls_private_key.client[*].private_key_pem
  sensitive   = true
}
output "vpn_client_server_cert" {
  description = "Cert of server certificate"
  value       = tls_locally_signed_cert.server.cert_pem
  sensitive   = true
}
output "vpn_client_server_key" {
  description = "Key cert of server certificate"
  value       = tls_private_key.server.private_key_pem
  sensitive   = true
}
output "vpn_client_ca_cert" {
  description = "Cert of ca certificate"
  value       = tls_self_signed_cert.ca.cert_pem
  sensitive   = true
}
output "vpn_client_ca_key" {
  description = "Key cert of ca certificate"
  value       = tls_private_key.ca.private_key_pem
  sensitive   = true
}

output "vpn_client_server_certificate_id" {
  description = "The ID of server certificate"
  value       = aws_acm_certificate.server.id
}

output "vpn_client_client_certificate_id" {
  description = "The ID of client cerififcate"
  value       = aws_acm_certificate.client[*].id
}

output "vpn_client_ca_certificate_id" {
  description = "The ID of ca certificate"
  value       = aws_acm_certificate.ca.id
}
