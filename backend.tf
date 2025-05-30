terraform {
  required_version = "~> 1.4.0"
  backend "s3" {
    bucket         = "terraform-pipeline-itau"
    region         = "us-east-2"
    key            = "terraform.tfstate"
    encrypt = true
  }
  required_providers {
    aws = {
      version = "~> 3.65.0"
      source = "hashicorp/aws"
    }
  }
}
