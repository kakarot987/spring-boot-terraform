data "aws_eks_cluster" "default" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "default" {
  name = module.eks.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.default.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.default.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.default.token
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
          name  = "todo"
          image = var.app_image
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
