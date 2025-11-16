terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
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
