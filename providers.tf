# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.74.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {
    # resource group
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}