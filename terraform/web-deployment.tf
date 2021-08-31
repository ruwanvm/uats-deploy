resource "kubernetes_deployment" "web-deployment" {
  metadata {
    name      = "web"
    namespace = var.environment
  }

  spec {
    replicas               = 1
    revision_history_limit = 2
    selector {
      match_labels = {
        app = "web"
      }
    }

    template {
      metadata {
        labels = {
          app = "web"
        }
      }

      spec {
        container {
          name  = "web"
          image = "${var.ECR_REGISTRY}/${var.ECR_REPOSITORY}:${var.APP_VERSION}"

          port {
            container_port = 7778
          }

          port {
            container_port = 4801
          }

          port {
            container_port = 8000
          }

          port {
            container_port = 8080
          }

          env {
            name  = "APP_VERSION"
            value = var.APP_VERSION
          }

          env {
            name  = "AWS_REGION"
            value = var.AWS_REGION
          }

          env {
            name  = "APP_ZONE"
            value = "web_v2"
          }

          env {
            name = "AWS_ACCESS_KEY_ID"

            value_from {
              secret_key_ref {
                name = "pod-aws-keys"
                key  = "AWS_ACCESS_KEY_ID"
              }
            }
          }

          env {
            name = "AWS_SECRET_ACCESS_KEY"

            value_from {
              secret_key_ref {
                name = "pod-aws-keys"
                key  = "AWS_SECRET_ACCESS_KEY"
              }
            }
          }
          resources {
            limits = {
              cpu    = "1"
              memory = "4Gi"
            }
          }
          image_pull_policy = "Always"
        }
      }
    }
  }
  depends_on = [
    kubernetes_namespace.namespace,
    kubernetes_secret.aws_keys,
    kubernetes_service.web_service,
    kubernetes_service.dynamodb,
  ]
}

