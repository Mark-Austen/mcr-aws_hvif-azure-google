terraform {
  required_providers {
    megaport = {
      source  = "megaport/megaport"
    }
    aws = {
      source  = "hashicorp/aws"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}

provider "megaport" {
  access_key            = "api-key"
  secret_key            = "api-secret"
  accept_purchase_terms = true
  delete_ports          = true
  environment           = "production"
}

provider "aws" {
  region = var.aws_region
  access_key = "access-key"
  secret_key = "secret-key"
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {} 
}
