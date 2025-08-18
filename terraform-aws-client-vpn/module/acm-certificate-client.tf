resource "tls_private_key" "client" {
  count = length(var.vpn_client_cert_list)

  algorithm = "RSA"
}

resource "tls_cert_request" "client" {
  count = length(var.vpn_client_cert_list)

  private_key_pem = tls_private_key.client[count.index].private_key_pem
  subject {
    common_name  = "${var.name}.${var.vpn_client_cert_list[count.index]}-client"
    organization = var.organization_name
  }
}

resource "tls_locally_signed_cert" "client" {
  count = length(var.vpn_client_cert_list)

  cert_request_pem   = tls_cert_request.client[count.index].cert_request_pem
  ca_private_key_pem = tls_private_key.ca.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.ca.cert_pem

  validity_period_hours = 87600

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "client_auth",
  ]
}

resource "aws_acm_certificate" "client" {
  count = length(var.vpn_client_cert_list)

  private_key       = tls_private_key.client[count.index].private_key_pem
  certificate_body  = tls_locally_signed_cert.client[count.index].cert_pem
  certificate_chain = tls_self_signed_cert.ca.cert_pem
}


# TBD store pem to s3 or ssm
# AWS SSM records
resource "aws_ssm_parameter" "vpn_client_key" {
  count = length(var.vpn_client_cert_list)

  name        = "${var.vpn_client_cert_list[count.index]}.${var.organization_name}.client_key"
  description = "VPN ${var.vpn_client_cert_list[count.index]} client key"
  type        = "SecureString"
  value       = tls_private_key.client[count.index].private_key_pem
}
resource "aws_ssm_parameter" "vpn_client_cert" {
  count = length(var.vpn_client_cert_list)


  name        = "${var.vpn_client_cert_list[count.index]}.${var.organization_name}.client_cert"
  description = "VPN ${var.vpn_client_cert_list[count.index]} client cert"
  type        = "SecureString"
  value       = tls_locally_signed_cert.client[count.index].cert_pem
}



# TBD create log configuration file and store in s3
