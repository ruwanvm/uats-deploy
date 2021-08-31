terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.4.1"
    }
  }
}

provider "kubernetes" {
  host                   = var.eks_host
  token                  = var.eks_token
  cluster_ca_certificate = base64decode(var.eks_certificate)
}