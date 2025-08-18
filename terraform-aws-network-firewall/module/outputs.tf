output "id" {
  value       = aws_networkfirewall_firewall.network_firewall.id
  description = "Created Network Firewall ID from network_firewall module"
}

output "arn" {
  description = "Created Network Firewall ARN from network_firewall module"
  value       = aws_networkfirewall_firewall.network_firewall.arn
}

output "endpoint_ids" {
  value = flatten(aws_networkfirewall_firewall.network_firewall.firewall_status[*].sync_states[*].attachment[*].endpoint_id[*])
}
output "subnet_id" {
  description = "Created Network Firewall subnet id"
  value       = flatten(aws_networkfirewall_firewall.network_firewall.firewall_status[*].sync_states[*].attachment[*])[*].subnet_id
}

output "sync_states" {
  description = "Created Network Firewall states"
  value       = (aws_networkfirewall_firewall.network_firewall.firewall_status[*].sync_states[*])
}

output "attachment" {
  description = "Created Network Firewall states"
  value       = (aws_networkfirewall_firewall.network_firewall.firewall_status[*].sync_states[*].attachment[*])
}