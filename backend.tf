terraform {
cloud {
    organization = "poc-itau-org"
    workspaces {
      name = "itau-pipeline-test-bruno"
    }
   }
  required_providers {
    aws = {
      version = "~> 3.65.0"
      source = "hashicorp/aws"
    }
  }
}
