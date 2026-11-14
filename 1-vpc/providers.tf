# `terraform/01-vpc/providers.tf`
#
# Configures the AWS provider and the remote backend for this specific VPC module.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = "~> 1.5"

  # The S3 backend for this module's state file.
  # The 'key' now reflects the module's purpose.
  backend "s3" {
    bucket         = "aws-eks-cicd-terraform-rashmi"
    key            = "vpc/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    use_lockfile   = true
  }
}

provider "aws" {
  region = var.aws_region
}