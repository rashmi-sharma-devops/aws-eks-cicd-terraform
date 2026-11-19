# `terraform/04-ecr/providers.tf`
#
# Configures the AWS provider and the remote backend for the ECR module.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = "~> 1.5"

  backend "s3" {
    bucket         = "aws-eks-cicd-terraform-rashmi"
    key            = "ecr/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    use_lockfile   = true
  }
}

provider "aws" {
  region = var.aws_region
}