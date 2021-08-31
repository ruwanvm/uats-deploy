# Deploy UATS microservice to a EKS cluster
This repository is used to deploy UATS microservice application to EKS cluster. Depend on the branch, it will deploy to different EKS clusters.

> you can enable to run on any other branch also. When configure to run on any other branch need to configure the Action secrets ***EKS_..._{branch-name}***

## Pre requisites
### Configure Action secrets
* TF_BACKEND_BUCKET - S3 bucket to save terraform state files
* TF_BACKEND_REGION - AWS region of the S3 bucket used to save terraform state files
* TF_AWS_ACCESS_KEY_ID - AWS access key id used by Terraform to provision the infrastructure
* TF_AWS_SECRET_ACCESS_KEY - AWS secret access key used by Terraform to provision the infrastructure
* EKS_HOST_{branch-name} - Kubernetes host endpoint of the EKS cluster
* EKS_TOKEN_{branch-name} - Kubernetes token of the EKS cluster
* EKS_CERT_{branch-name} - Kubernetes certificate of the EKS cluster
> **EKS_\*\*_{branch-name}** secret values can be taken from tfstate files created during the EKS cluster creation