resource "aws_ec2_managed_prefix_list" "cloudflare_ipv4" {
  name           = var.cloudflare_ipv4_pl_name
  address_family = "IPv4"
  max_entries    = 15

  entry {
    cidr = "103.21.244.0/22"
  }
  entry {
    cidr = "103.22.200.0/22"
  }
  entry {
    cidr = "103.31.4.0/22"
  }
  entry {
    cidr = "104.16.0.0/13"
  }
  entry {
    cidr = "104.24.0.0/14"
  }
  entry {
    cidr = "108.162.192.0/18"
  }
  entry {
    cidr = "131.0.72.0/22"
  }
  entry {
    cidr = "141.101.64.0/18"
  }
  entry {
    cidr = "162.158.0.0/15"
  }
  entry {
    cidr = "172.64.0.0/13"
  }
  entry {
    cidr = "173.245.48.0/20"
  }
  entry {
    cidr = "188.114.96.0/20"
  }
  entry {
    cidr = "190.93.240.0/20"
  }
  entry {
    cidr = "197.234.240.0/22"
  }
  entry {
    cidr = "198.41.128.0/17"
  }
  tags = merge(var.tags)

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ec2_managed_prefix_list" "cloudflare_ipv6" {
  name           = var.cloudflare_ipv6_pl_name
  address_family = "IPv6"
  max_entries    = 7

  entry {
    cidr = "2400:cb00::/32"
  }
  entry {
    cidr = "2606:4700::/32"
  }
  entry {
    cidr = "2803:f800::/32"
  }
  entry {
    cidr = "2405:b500::/32"
  }
  entry {
    cidr = "2405:8100::/32"
  }
  entry {
    cidr = "2a06:98c0::/29"
  }
  entry {
    cidr = "2c0f:f248::/32"
  }
  tags = merge(var.tags)

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "cloudflare" {
  name                   = var.name != "" ? var.name : null
  name_prefix            = var.name_prefix != "" ? var.name_prefix : null
  description            = var.description
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = var.revoke_rules_on_delete

  ingress {
    description     = "Allow Cloudflare IPv4 IPs"
    from_port       = var.from_port
    to_port         = var.to_port
    protocol        = var.protocol
    prefix_list_ids = [aws_ec2_managed_prefix_list.cloudflare_ipv4.id]
  }

  ingress {
    description     = "Allow Cloudflare IPv6 IPs"
    from_port       = var.from_port
    to_port         = var.to_port
    protocol        = var.protocol
    prefix_list_ids = [aws_ec2_managed_prefix_list.cloudflare_ipv6.id]
  }

  tags = merge(var.tags)

  lifecycle {
    create_before_destroy = true
  }
}
