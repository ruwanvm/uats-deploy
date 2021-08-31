variable "eks_host" {
  description = "EKS cluster endpoint"
}
variable "eks_certificate" {
  description = "EKS cluster certificate value"
}
variable "environment" {
  description = "Environment name"
}

variable "POD_AWS_ACCESS_KEY_ID" {
  description = "AWS_ACCESS_KEY_ID used by microservices to access AWS resources"
}
variable "POD_AWS_SECRET_ACCESS_KEY" {
  description = "AWS_SECRET_ACCESS_KEY used by microservices to access AWS resources"
}

variable "ECR_REGISTRY" {
  description = "ECR registry endpoint"
}

variable "ECR_REPOSITORY" {
  description = "ECR registry endpoint"
}

variable "APP_VERSION" {
  description = "ECR registry endpoint"
}

locals {
  cluster_name = "${var.environment}-eks-cluster"
}

locals {
  env_name_gen2 = "${var.environment}_v2"
}