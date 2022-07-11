variable "name" {
  description = "Name for the security group, conflicts with `name_prefix`"
  type        = string
  default     = ""
}

variable "name_prefix" {
  description = "Name prefix for the security group, conflicts with `name`"
  type        = string
  default     = ""
}

variable "cloudflare_ipv4_pl_name" {
  description = "Name for the pl"
  type        = string
  default     = "Cloudflare IPv4"
}

variable "cloudflare_ipv6_pl_name" {
  description = "Name for the pl"
  type        = string
  default     = "Cloudflare IPv6"
}

variable "description" {
  description = "Security Group description"
  type        = string
  default     = "Cloudflare"
}

variable "vpc_id" {
  description = "VPC ID to attach the security group"
  type        = string
}

variable "revoke_rules_on_delete" {
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "from_port" {
  description = "Start port to allow, defaults to all"
  type        = number
  default     = 0

}

variable "to_port" {
  description = "End port to allow, defaults to all"
  type        = number
  default     = 0
}

variable "protocol" {
  description = "Protocol to allow, defaults to all"
  type        = string
  default     = "-1"
}
