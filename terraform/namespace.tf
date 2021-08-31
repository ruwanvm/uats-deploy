resource "kubernetes_namespace" "app-namespace" {
  metadata {
    name = var.environment
  }
}

