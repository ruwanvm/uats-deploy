variable "eks_host" {
  description = "EKS cluster endpoint"
}
variable "eks_token" {
  default = "EKS cluster auth token"
}
variable "eks_certificate" {
  default = "EKS cluster certificate value"
}
variable "environment" {
  default = "EKS cluster environment"
}

locals {
  cluster_name = "${var.environment}-eks-cluster"
}