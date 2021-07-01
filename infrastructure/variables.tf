variable "environment" {
  default     = "staging"
  description = "Environment"
}

variable "service_name" {
  description = "This is the name of the service"
}

variable "aws_profile" {
  description = "AWS Profile"
}

variable "aws_region" {
  description = "AWS Region"
}

variable "instance_ami" {
  default = "ami-0567f647e75c7bc05"
  description = "Ubuntu Server 20.04 LTS 64-bit x86"
}

variable "instance_type" {
  default = "t2.nano"
}

variable "key_path" {
  default = "keys/mykeypair.pub"
}

variable "enable_bastion" {
  default = false
}

locals {
  service_name_env = "${var.service_name}-${var.environment}"
}
