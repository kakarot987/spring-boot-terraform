# Terraform's Kubernetes provider requires a declared Google client config data source.
data "google_client_config" "default" {}

# Placeholder for deploying Spring Boot app to GKE using Kubernetes provider
provider "kubernetes" {
  host                   = google_container_cluster.primary.endpoint
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
  token                  = data.google_client_config.default.access_token
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
