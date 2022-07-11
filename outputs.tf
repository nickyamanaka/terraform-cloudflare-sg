output "cloudflare_sg_id" {
  description = "Cloudflare Security Group ID"
  value       = aws_security_group.cloudflare.id
}

output "cloudflare_sg" {
  description = "Cloudflare Security Group"
  value       = aws_security_group.cloudflare
}

output "cloudflare_ipv4_pl" {
  description = "Cloudflare IPv4 pl"
  value       = aws_ec2_managed_prefix_list.cloudflare_ipv4
}

output "cloudflare_ipv6_pl" {
  description = "Cloudflare IPv6 pl"
  value       = aws_ec2_managed_prefix_list.cloudflare_ipv6
}

