provider "aws" {
  region = var.region
}

resource "aws_db_subnet_group" "postgres_subnet_group" {
  name       = "todo-postgres-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "todo-db-subnet-group"
  }
}

resource "aws_db_instance" "postgres" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "15.3"
  instance_class       = "db.t3.micro"
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.postgres_subnet_group.name
  skip_final_snapshot  = true
  publicly_accessible  = false
  vpc_security_group_ids = [var.db_security_group_id]

  tags = {
    Name = "todo-postgres"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = "todo-eks"
  cluster_version = "1.28"
  subnet_ids      = var.private_subnet_ids
  vpc_id          = var.vpc_id

  enable_irsa = true

  node_groups = {
    default = {
      desired_capacity = 1
      max_capacity     = 2
      min_capacity     = 1
      instance_types   = ["t3.medium"]
    }
  }
}
