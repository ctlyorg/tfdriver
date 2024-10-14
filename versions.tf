terraform {
  required_version = ">= 0.13"
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

  client_id = "4d0041ad-0ab3-4a79-a6bf-3fa336b2af50"
  client_secret = "Ur28Q~v35sGqtWZlya~ZF5tMxwbZVRxvbdUt9cpB"
  tenant_id = "6bb1947d-170d-407c-a557-34a5e3f286ce"
  subscription_id = "bdf3fb29-e42c-49b8-8346-59ccc34d3562"
}
