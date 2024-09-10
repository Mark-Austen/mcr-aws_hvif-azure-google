terraform {
  required_providers {
    megaport = {
      source  = "megaport/megaport"
      version = ">=1.1.5"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.64.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.116.0"
    }
    google = {
      source = "hashicorp/google"
      version = "6.2.0"
    }
  }
}

provider "megaport" {
  access_key            = "api-key"
  secret_key            = "api-secret"
  accept_purchase_terms = true
  environment           = "production"
}

provider "aws" {
  region = var.aws_region_1
  access_key = "access-key"
  secret_key = "secret-key"
}

provider "azurerm" {
  features {} 
}

provider "google" {
  project = "project_name"
  region = "region"
}
