terraform {
  required_version = ">= 0.15.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  dynamic "assume_role" {
    for_each = var.aws_account != null && var.assume_role_name != null ? ["arn:aws:iam::${var.aws_account}:role/${var.assume_role_name}"] : []
    content {
      role_arn = assume_role.value
    }
  }

  default_tags {
    tags = merge(
      {
        Terraform   = "true"
        Environment = var.environment
      },
      #      var.map_server_id != null ? { map-migrated = var.map_server_id } : {}
    )
  }
}