variable "environment" {
  type        = string
  default     = "staging"
  description = "Environment"
}

variable "service_name" {
  type        = string
  description = "This is the name of the service"
}

variable "aws_profile" {
  type        = string
  description = "AWS Profile"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "instance_ami" {
  type        = string
  default     = "ami-0567f647e75c7bc05"
  description = "Ubuntu Server 20.04 LTS 64-bit x86"
}

variable "instance_type" {
  type    = string
  default = "t2.nano"
}

variable "key_path" {
  type    = string
  default = "keys/mykeypair.pub"
}

variable "enable_bastion" {
  type    = bool
  default = false
}

variable "rds_instance_class" {
  description = "RDS Instance type"
}

variable "rds_allocated_storage" {
  type        = number
  description = "Allocated storage for RDS instance"
}

variable "rds_database_name" {
  type        = string
  description = "RDS database name"
}

variable "rds_max_connections" {
  type        = number
  description = "RDS database name"
}

locals {
  service_name_env = "${var.service_name}-${var.environment}"
}
