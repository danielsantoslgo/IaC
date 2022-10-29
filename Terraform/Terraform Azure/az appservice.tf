terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.41.0"
    }
  }
}

provider "azurerm" {
  features  {}
}


resource "azurerm_resource_group" "rg" {
  name     = "ntwtech"
  location = "westus2"
}

resource "azurerm_app_service_plan" "app-plan-linux" {
  name                = "ntweekly-linux"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "p1v2"
  }
}

resource "azurerm_app_service_plan" "app-plan-win" {
  name                = "ntweekly-win"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "windows"
  reserved            = false

  sku {
    tier = "Standard"
    size = "p1v2"
  }
}