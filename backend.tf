terraform {
  backend "s3" {
    bucket         = "terraform-pipeline-itau"
    region         = "us-east-2"
    key            = "terraform.tfstate"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.65.0"

    }
  }
}
