###################################
#Create AWS Netwrok Firewall
###################################
resource "aws_networkfirewall_firewall" "network_firewall" {
  name                              = var.firewall_name
  vpc_id                            = var.vpc_id
  firewall_policy_arn               = aws_networkfirewall_firewall_policy.this.arn
  firewall_policy_change_protection = var.firewall_policy_change_protection
  subnet_change_protection          = var.subnet_change_protection
  delete_protection                 = var.delete_protection
  dynamic "subnet_mapping" {
    for_each = var.subnet_mapping
    content {
      subnet_id = subnet_mapping.value
    }
  }
  tags = var.tags
}

###################### Logging Config ######################
resource "aws_networkfirewall_logging_configuration" "anfw_logging_configuration_s3" {
  firewall_arn = aws_networkfirewall_firewall.network_firewall.arn
  logging_configuration {
    log_destination_config {
      log_destination = {
        bucketName = var.bucket_name_logging
        prefix     = "${var.s3_logs_prefix}/flow_logs/"
      }
      log_destination_type = "S3"
      log_type             = "FLOW"
    }
    log_destination_config {
      log_destination = {
        bucketName = var.bucket_name_logging
        prefix     = "${var.s3_logs_prefix}/alert_logs/"
      }
      log_destination_type = "S3"
      log_type             = "ALERT"
    }
  }
}

resource "aws_route" "tgw_attachment_route_to_firewall_rt" {
  count                  = length(var.route_for_tgw_route_table_ids)
  route_table_id         = var.route_for_tgw_route_table_ids[count.index]
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = flatten(aws_networkfirewall_firewall.network_firewall.firewall_status[*].sync_states[*].attachment[*].endpoint_id[*])[count.index]
}
