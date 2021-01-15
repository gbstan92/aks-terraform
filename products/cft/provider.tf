provider "azurerm" {
  version = "=2.36.0"
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

terraform {
  required_version = ">= 0.13.0"

  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.41.0"
    }
  }
}