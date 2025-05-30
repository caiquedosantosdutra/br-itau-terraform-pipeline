terraform {
   cloud {
    organization = "poc-itau-org"
    workspaces {
      name = "itau-pipeline-workspace"
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
