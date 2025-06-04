terraform {
   cloud {
      organization = "poc-itau-org"
      workspaces {
        tags = ["caique-dev"]
      }
    }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.65.0"

    }
  }
}
