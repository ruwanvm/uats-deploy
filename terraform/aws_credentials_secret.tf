resource "kubernetes_secret" "aws_keys" {
  metadata {
    name      = "pod-aws-keys"
    namespace = kubernetes_namespace.namespace.id
  }

  data = {
    AWS_ACCESS_KEY_ID     = var.POD_AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY = var.POD_AWS_SECRET_ACCESS_KEY
  }

  depends_on = [
    kubernetes_namespace.namespace
  ]
}