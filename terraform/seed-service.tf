resource "kubernetes_service" "seed_service" {
  metadata {
    name      = "seed-service"
    namespace = kubernetes_namespace.namespace.id

    labels = {
      app = "seed"
    }
  }

  spec {
    port {
      name = "service-port"
      port = 7778
    }

    port {
      name = "membership-port"
      port = 4801
    }

    selector = {
      app = "seed"
    }
  }
  depends_on = [
    kubernetes_namespace.namespace,
  ]
}