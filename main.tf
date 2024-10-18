resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

module "storage_account_az1" {
  source = "github.com/ctlyorg/tfModules"

  resource_group_name = azurerm_resource_group.example.name
  resource_group_location = azurerm_resource_group.example.location

  settings = {
    account_tier                      = "Standard"
    account_replication_type          = "LRS"
    min_tls_version                   = "TLS1_0"
  }
}



terraform {
  required_version = ">= 0.14"
  backend "local" {
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}
