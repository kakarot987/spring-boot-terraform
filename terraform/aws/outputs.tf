output "db_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
