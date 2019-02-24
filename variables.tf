variable "vpc_name" {}
variable "aws_region" {}
variable "domain_name" {}

variable "comment" {
    default = ""
}
variable "subject_alternative_names" {
  type = "list"
}

variable "tags" {
  type = "map"
  default = {}
}

variable "vpc_associations" {
  type = "list"
  default = []
}
