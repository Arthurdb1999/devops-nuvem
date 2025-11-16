terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket  = "workshop-bucket-arthurdb"
    key     = "eks/terraform.tfstate"
    region  = "us-east-1"
    profile = "arthurdb"
    # use_lockfile = true
    dynamodb_table = "workshop-state-locking-table"
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = var.assume_role.region
  profile = var.assume_role.profile

  assume_role {
    role_arn = var.assume_role.arn
  }

  default_tags {
    tags = var.tags
  }
}
