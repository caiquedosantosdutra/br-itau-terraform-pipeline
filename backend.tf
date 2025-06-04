terraform {
   cloud {
      organization = "poc-itau-org"
      workspaces {
        tags = ["itau-pipeline-workspace"]
      }
    }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.65.0"

    }
  }
}
