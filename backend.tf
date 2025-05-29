terraform {
   cloud {
    organization = "POC-I"
    workspaces {
      name = "learn-terraform-migrate"
    }
   }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source = "hashicorp/aws"
    }
  }
}
