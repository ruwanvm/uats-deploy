variable "microservice_name" {
  default = ""
}
variable "namespace" {
  default = ""
}
variable "replicas" {
  default = 1
}
variable "ecr_registry" {
  default = ""
}
variable "ecr_repo" {
  default = ""
}
variable "app_version" {
  default = ""
}
variable "env_name" {
  default = ""
}
variable "aws_region" {
  default = ""
}
variable "cpu" {
  default = "500m"
}
variable "memory" {
  default = "512Mi"
}
resource "kubernetes_deployment" "microservice-deployment" {
  metadata {
    name      = var.microservice_name
    namespace = var.namespace
  }
  spec {
    replicas               = var.replicas
    revision_history_limit = 2
    selector {
      match_labels = {
        app = var.microservice_name
      }
    }
    template {
      metadata {
        labels = {
          app = var.microservice_name
        }
      }
      spec {
        container {
          name  = var.microservice_name
          image = "${var.ecr_registry}/${var.ecr_repo}:${var.app_version}"
          port {
            container_port = 7778
          }
          port {
            container_port = 4801
          }

          env {
            name  = "APP_VERSION"
            value = var.app_version
          }
          env {
            name  = "APP_ZONE"
            value = "${var.microservice_name}_v2"
          }
          env {
            name = "AWS_ACCESS_KEY_ID"
            value_from {
              secret_key_ref {
                name = "aws-keys"
                key  = "AWS_ACCESS_KEY_ID"
              }
            }
          }
          env {
            name = "AWS_SECRET_ACCESS_KEY"
            value_from {
              secret_key_ref {
                name = "aws-keys"
                key  = "AWS_SECRET_ACCESS_KEY"
              }
            }
          }
          env {
            name  = "ENV_NAME"
            value = var.env_name
          }
          env {
            name  = "AWS_REGION"
            value = var.aws_region
          }
          resources {
            limits = {
              cpu    = var.cpu
              memory = var.memory
            }
          }
          image_pull_policy = "IfNotPresent"
        }
      }
    }
  }
}