resource "aws_ec2_client_vpn_endpoint" "default" {
  description            = var.description
  server_certificate_arn = aws_acm_certificate.server.arn
  client_cidr_block      = var.cidr
  split_tunnel           = var.split_tunnel
  vpn_port               = var.vpn_client_port
  dns_servers            = var.dns_servers
  self_service_portal    = local.self_service_portal

  security_group_ids = [var.security_group_id == "" ? aws_security_group.default[0].id : var.security_group_id]
  vpc_id             = var.vpc_id


  authentication_options {
    type                           = var.authentication_type
    root_certificate_chain_arn     = var.authentication_type != "certificate-authentication" ? null : aws_acm_certificate.server.arn
    saml_provider_arn              = var.authentication_saml_provider_arn
    active_directory_id            = var.active_directory_id
    self_service_saml_provider_arn = var.self_service_saml_provider_arn
  }

  connection_log_options {
    enabled               = false
    cloudwatch_log_group  = aws_cloudwatch_log_group.vpn.name
    cloudwatch_log_stream = aws_cloudwatch_log_stream.vpn.name
  }

  tags = {
    Name = var.name
  }
}

resource "aws_ec2_client_vpn_network_association" "default" {
  count                  = length(var.subnet_ids)
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.default.id
  subnet_id              = element(var.subnet_ids, count.index)
  depends_on             = [aws_ec2_client_vpn_endpoint.default]
}

resource "aws_ec2_client_vpn_authorization_rule" "specific_groups" {
  count                  = length(var.allowed_access_groups) * length(var.allowed_cidr_ranges)
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.default.id
  target_network_cidr    = element(var.allowed_cidr_ranges, floor(count.index / length(var.allowed_access_groups)))
  access_group_id        = element(var.allowed_access_groups, count.index % length(var.allowed_access_groups))
  description            = "Allow access to ${element(var.destination_cidr_block, floor(count.index / length(var.allowed_access_groups)))} from ${element(var.allowed_access_groups, count.index % length(var.allowed_access_groups))}"
}

resource "aws_ec2_client_vpn_route" "this" {
  count = length(var.destination_cidr_block) > 0 ? length(var.destination_cidr_block) : 0

  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.default.id
  destination_cidr_block = element(var.destination_cidr_block, count.index)
  target_vpc_subnet_id   = element(var.subnet_ids, count.index)
  depends_on             = [aws_ec2_client_vpn_network_association.default]
}
