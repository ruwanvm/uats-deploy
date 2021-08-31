variable "eks_host" {
  description = "EKS cluster endpoint"
}
variable "eks_token" {
  description = "EKS cluster auth token"
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

locals {
  cluster_name = "${var.environment}-eks-cluster"
}