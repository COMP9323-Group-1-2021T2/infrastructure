resource "random_string" "postgres_password" {
  length  = 30
  special = false
}

resource "aws_db_subnet_group" "postgres_subnet_group" {
  name       = "${var.service_name}-${var.environment}-db-subnet-group"
  subnet_ids = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]
}

resource "aws_rds_cluster" "postgres-sls-cluster" {
  cluster_identifier      = "${var.service_name}-${var.environment}-sls"
  engine                  = "aurora-postgresql"
  engine_mode             = "serverless"
  enable_http_endpoint    = true
  database_name           = var.rds_database_name
  master_username         = "postgres"
  master_password         = random_string.postgres_password.result
  backup_retention_period = 5

  scaling_configuration {
    auto_pause               = true
    max_capacity             = 4
    min_capacity             = 2
    seconds_until_auto_pause = 300
    timeout_action           = "ForceApplyCapacityChange"
  }

  db_subnet_group_name   = aws_db_subnet_group.postgres_subnet_group.name
  vpc_security_group_ids = [aws_vpc.vpc.default_security_group_id]
}

resource "aws_ssm_parameter" "postgres_db_conn_url_ssm" {
  name  = "/${var.service_name}/${var.environment}/DB_CONN_URL"
  type  = "SecureString"
  value = "postgres://${aws_rds_cluster.postgres-sls-cluster.master_username}:${random_string.postgres_password.result}@${aws_rds_cluster.postgres-sls-cluster.endpoint}/${var.rds_database_name}"

  depends_on = [
    aws_rds_cluster.postgres-sls-cluster,
  ]
}
