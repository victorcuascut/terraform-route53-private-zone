terraform {
  required_version = ">= 0.9.3"
}

provider "aws" {
  allowed_account_ids = [
    "${var.user_account_id}"
  ]
  region = "${var.aws_region}"
}

module "route53-private-zone" {
    source = "../."
    vpc_name    = "${var.vpc_name}"
    aws_region  = "${var.aws_region}"
    domain_name = "${var.domain_name}"
    subject_alternative_names = "${var.subject_alternative_names}"
}