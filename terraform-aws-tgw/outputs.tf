output "id" {
  description = "The ID of the Transit Gateway"
  value       = aws_ec2_transit_gateway.tgw.id
}

output "arn" {
  description = "The ARN of the Transit Gateway"
  value       = aws_ec2_transit_gateway.tgw.arn
}

output "tgw_spoke_route_table_id" {
  description = "The ID of the Spoke Route Table"
  value       = try(aws_ec2_transit_gateway_route_table.spoke[0].id, "")
}

output "tgw_spoke_route_table_arn" {
  description = "The ARN of the Spoke Route Table"
  value       = try(aws_ec2_transit_gateway_route_table.spoke[0].arn, "")
}

output "tgw_hub_route_table_id" {
  description = "The ID of the Hub Route Table"
  value       = try(aws_ec2_transit_gateway_route_table.hub[0].id, "")
}

output "tgw_hub_route_table_arn" {
  description = "The ARN of the Hub Route Table"
  value       = try(aws_ec2_transit_gateway_route_table.hub[0].arn, "")
}

output "tgw_route_table_id" {
  description = "The ID of the TGW Route Table (in a single TGW RT deployment)"
  value       = try(aws_ec2_transit_gateway_route_table.selected[0].id, "")
}

#output "tgw_rt_per_env" {
#  value = {
#    for k, v in aws_ec2_transit_gateway_route_table.selected : k => v
#  }
#}

#output "tgw_ram_resource_share_id" {
#  description = "The ID of the TGW RAM share"
#  value       = aws_ram_resource_share.tgw.id
#}
#
#output "tgw_ram_resource_share_arn" {
#  description = "The ARN of the TGW RAM share"
#  value       = aws_ram_resource_share.tgw.arn
#}