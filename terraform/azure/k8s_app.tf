# Placeholder for deploying Spring Boot app to AKS using Kubernetes provider
provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.aks.kube_config[0].host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate)
}

resource "kubernetes_deployment" "todo_app" {
  metadata {
    name = "todo-app"
    labels = {
      app = "todo"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "todo"
      }
    }
    template {
      metadata {
        labels = {
          app = "todo"
        }
      }
      spec {
        container {
          image = var.app_image
          name  = "todo-container"
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "todo_service" {
  metadata {
    name = "todo-service"
  }
  spec {
    selector = {
      app = "todo"
    }
    port {
      port        = 80
      target_port = 8080
    }
    type = "LoadBalancer"
  }
}
