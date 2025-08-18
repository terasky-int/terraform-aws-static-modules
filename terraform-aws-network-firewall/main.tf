module "network_firewall" {
  source = "./module"

  firewall_name  = var.anfw_name
  policy_name    = var.anfw_policy_name
  vpc_id         = data.aws_vpc.inspection_vpc.id
  subnet_mapping = data.aws_subnets.firewall_subnets.ids

  #  Logging Config 
  bucket_name_logging = var.anfw_bucket_name_logging # Store flow logs to s3 on log archived account
  s3_logs_prefix      = var.anfw_name


  # Routes
  route_for_tgw_route_table_ids    = data.aws_route_tables.inspection_tgw_rts.ids
  route_for_public_route_table_ids = data.aws_route_tables.inspection_public_rts.ids
  inspection_vpc_igw_id            = data.aws_internet_gateway.inspection_vpc_igw.id

  # Rules Config 
  # Stateless Rule Config 
  stateless_rule_group = var.stateless_rule_group
  # 5-Tuple Config 
  fivetuple_stateful_rule_group = var.fivetuple_stateful_rule_group

  # Suricata Rule Config
  suricata_stateful_rule_group = var.suricata_stateful_rule_group

  # Domain Rule Config 
  domain_stateful_rule_group = var.domain_stateful_rule_group

  # Stateful Rule Config
  aws_managed_rule_group = var.aws_managed_rule_group
}
