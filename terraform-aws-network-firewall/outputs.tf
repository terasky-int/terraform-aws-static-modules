output "aws_firewall_id" {
  description = "The ID of AWS Netwrok Firewall"
  value       = try(module.network_firewall[*].id, null)
}

output "firewall_endpoint_ids" {
  description = "ListIDs of firewall endppoinds"
  value       = try(module.network_firewall[*].endpoint_ids, null)
}

output "aws_firewall_arn" {
  description = "ARN of Network Firewall"
  value       = try(module.network_firewall[*].arn, null)
}
