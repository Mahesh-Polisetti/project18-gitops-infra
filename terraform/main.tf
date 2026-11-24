terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket       = "project18-terraform-state-590507089733"
    key          = "project18/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "gitops_demo" {
  bucket = "project18-gitops-demo-unique-590507089733"
}
