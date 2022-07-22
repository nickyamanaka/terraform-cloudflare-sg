# AWS Cloudflare Security Group

Terraform module which creates a security group with the latest IPs CIDRs from [Cloudflare](https://www.cloudflare.com/ips/)

## Usage
```hcl
module "vpc" {
  source = "github.com/nickyamanaka/terraform-cloudflare-sg?ref=v1.0.1"
  name   = "cloudflare"
  vpc_id = "vpc-xxxxxxxxxxxxxxxxx"
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ec2_managed_prefix_list.cloudflare_ipv4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_managed_prefix_list) | resource |
| [aws_ec2_managed_prefix_list.cloudflare_ipv6](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_managed_prefix_list) | resource |
| [aws_security_group.cloudflare](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.cloudflare_sg_ingress_ipv4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.cloudflare_sg_ingress_ipv6](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_ipv4_pl_name"></a> [cloudflare\_ipv4\_pl\_name](#input\_cloudflare\_ipv4\_pl\_name) | Name for the pl | `string` | `"Cloudflare IPv4"` | no |
| <a name="input_cloudflare_ipv6_pl_name"></a> [cloudflare\_ipv6\_pl\_name](#input\_cloudflare\_ipv6\_pl\_name) | Name for the pl | `string` | `"Cloudflare IPv6"` | no |
| <a name="input_description"></a> [description](#input\_description) | Security Group description | `string` | `"Cloudflare"` | no |
| <a name="input_from_port"></a> [from\_port](#input\_from\_port) | Start port to allow, defaults to all | `number` | `0` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the security group, conflicts with `name_prefix` | `string` | `""` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Name prefix for the security group, conflicts with `name` | `string` | `""` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Protocol to allow, defaults to all | `string` | `"-1"` | no |
| <a name="input_revoke_rules_on_delete"></a> [revoke\_rules\_on\_delete](#input\_revoke\_rules\_on\_delete) | Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_to_port"></a> [to\_port](#input\_to\_port) | End port to allow, defaults to all | `number` | `0` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to attach the security group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudflare_ipv4_pl"></a> [cloudflare\_ipv4\_pl](#output\_cloudflare\_ipv4\_pl) | Cloudflare IPv4 pl |
| <a name="output_cloudflare_ipv6_pl"></a> [cloudflare\_ipv6\_pl](#output\_cloudflare\_ipv6\_pl) | Cloudflare IPv6 pl |
| <a name="output_cloudflare_sg"></a> [cloudflare\_sg](#output\_cloudflare\_sg) | Cloudflare Security Group |
| <a name="output_cloudflare_sg_id"></a> [cloudflare\_sg\_id](#output\_cloudflare\_sg\_id) | Cloudflare Security Group ID |
<!-- END_TF_DOCS -->