data "aws_vpcs" "selected" {
  tags {
    Name = "${var.vpc_name}"
  }
}

resource "aws_route53_zone" "private_zone" {
    name        = "${var.domain_name}"
    comment     = "${var.comment}"
    tags        = "${var.tags}"

    vpc {
      vpc_id = "${data.aws_vpcs.selected.ids[0]}"
  }
}

output "zone_id" {
  value       = "${aws_route53_zone.private_zone.zone_id}"
}

output "name_servers" {
  value       = "${aws_route53_zone.private_zone.name_servers}"
}

resource "aws_acm_certificate" "cert" {
  domain_name       = "${var.domain_name}"
  subject_alternative_names = "${var.subject_alternative_names}"
  validation_method = "DNS"
  tags = "${var.tags}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_zone_association" "main" {
  count = "${length(var.vpc_associations)}"
  zone_id = "${aws_route53_zone.private_zone.zone_id}"
  vpc_id  = "${element(var.vpc_associations, count.index)}"
}