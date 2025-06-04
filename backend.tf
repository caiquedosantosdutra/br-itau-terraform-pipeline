terraform {
  cloud {
    organization = "poc-itau-org"
    workspaces {
      name = "itau-pipeline-workspace-migration"
    }
  }
  required_providers {
    aws = {
      version = "~> 3.65.0"
      source = "hashicorp/aws"
    }
  }
}
