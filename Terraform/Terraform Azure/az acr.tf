required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-tf-acr"
  location = "westus"
}

resource "azurerm_container_registry" "acr" {
  name                     = "acrname"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  sku                      = "Basic"
  admin_enabled            = true
}

output "admin_password" {
  value       = azurerm_container_registry.acr.admin_password
  description = "The object ID of the user"
}