# terraform-route53-private-zone

This Module creates a Route53 Private Zone

---

## Introduction

The module provisions the following resources:

- aws_route53_zone

## Usage


For a complete example, see [examples]

```hcl
module "route53-private-zone" {
    source  = "../."
    vpc_name    = "${var.vpc_name}"
    aws_region  = "${var.aws_region}"
    domain_name = "${var.domain_name}"
}
```

## Inputs

| Name | Description | Type | Required |
|------|-------------|:----:|:-----:|:-----:|
| vpc_name | VPC Name this is used to find the vpc id | `<string>` | yes |
| aws_region | Region to associate the private zone | `<string>` | yes |
| domain_name | Domain name used to create the private zone | `<string>` | yes |
| Comment | Comment to add to private zone | `<string>` | no |
| tags | Tags to add to private zone | `<map>` | no |

