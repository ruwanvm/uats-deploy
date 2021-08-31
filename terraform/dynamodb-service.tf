resource "kubernetes_service" "dynamodb" {
  metadata {
    name      = "dynamodb-service"
    namespace = kubernetes_namespace.namespace.id
  }

  spec {
    type          = "ExternalName"
    external_name = local.dynamodb_endpoint
  }
}

