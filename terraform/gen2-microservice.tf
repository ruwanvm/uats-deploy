module "seed-microservice" {
  source            = "./modules/microservice"
  namespace         = kubernetes_namespace.namespace.id
  microservice_name = "seed"
  ecr_registry      = var.ECR_REGISTRY
  ecr_repo          = var.ECR_REPOSITORY
  app_version       = var.APP_VERSION
  aws_region        = var.AWS_REGION
  env_name          = local.env_name_gen2
  depends_on = [
    kubernetes_namespace.namespace,
    kubernetes_service.seed_service,
  ]
}

module "web-microservice" {
  source            = "./modules/microservice"
  namespace         = kubernetes_namespace.namespace.id
  microservice_name = "web"
  ecr_registry      = var.ECR_REGISTRY
  ecr_repo          = var.ECR_REPOSITORY
  app_version       = var.APP_VERSION
  aws_region        = var.AWS_REGION
  env_name          = local.env_name_gen2
  cpu = "1"
  memory = "4Gi"
  depends_on = [
    kubernetes_namespace.namespace,
    kubernetes_service.seed_service,
    kubernetes_service.web_service,
  ]
}