resource "kubernetes_service" "web_service" {
  metadata {
    name      = "web-service"
    namespace = kubernetes_namespace.namespace.id

    labels = {
      app = "web"
    }
  }

  spec {
    port {
      name = "http-port"
      port = 8080
    }

    port {
      name = "websocket-port"
      port = 8000
    }

    selector = {
      app = "web"
    }
  }
  depends_on = [
    kubernetes_namespace.namespace,
  ]
}