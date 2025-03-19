output "db_instance_connection_name" {
  value = google_sql_database_instance.postgres_instance.connection_name
}

output "gke_cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "todo_service_ip_gcp" {
  value = kubernetes_service.todo_service.status[0].load_balancer[0].ingress[0].ip
}
