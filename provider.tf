provider "aws" {
  region  = var.region
  profile = var.profile
}

# Root: backend.tf
terraform {
  backend "s3" {
    bucket         = var.s3_bucket
    key            = "state/${var.env}/terraform.tfstate"
    region         = var.region
    dynamodb_table = var.dynamodb_table
    encrypt        = true
  }
}