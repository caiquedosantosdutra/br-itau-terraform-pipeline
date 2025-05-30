terraform {
  required_version = "~> 1.4.0"
  cloud {
      organization = "poc-itau-org"
      workspaces {
        name = "itau-pipeline-workspace"
      }
    }
  required_providers {
    aws = {
      version = "~> 3.65.0"
      source = "hashicorp/aws"
    }
  }
}
