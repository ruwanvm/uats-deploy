//resource "kubernetes_service" "dynamodb" {
//  # This will used when the DYNAMODB_HOST environment variable is set on deployment
//  metadata {
//    name      = "dynamodb"
//    namespace = kubernetes_namespace.namespace.id
//  }
//
//  spec {
//    type          = "ExternalName"
//    external_name = local.dynamodb_endpoint
//    port {
//      name = "https-port"
//      port = 443
//    }
//  }
//}
//
