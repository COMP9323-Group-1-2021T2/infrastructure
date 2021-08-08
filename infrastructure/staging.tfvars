# This file includes all of our staging environment custom configuration
environment  = "staging"
service_name = "comp9323"
aws_profile  = "comp9323"
aws_region   = "ap-southeast-2"

# Bastion
enable_bastion = false

# RDS
rds_instance_class    = "db.t3.micro"
rds_allocated_storage = 10
rds_database_name     = "mydatabase"
rds_max_connections   = 200
