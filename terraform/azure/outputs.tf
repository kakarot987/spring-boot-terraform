output "postgresql_server_name" {
  value = azurerm_postgresql_flexible_server.example.name
}

output "aks_cluster_endpoint" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].host
}

output "todo_service_ip_azure" {
  value = kubernetes_service.todo_service.status[0].load_balancer[0].ingress[0].ip
}
