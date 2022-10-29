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
  name     = "TRF1"
  location = "westus2"
}



resource "azurerm_container_group" "ntweekly" {
  name                = "ntweekly-group"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "public"
  dns_name_label      = "aci-label"
  os_type             = "Linux"

  image_registry_credential {
    server   = "servername.azurecr.io"
    username = "acrusername"
    password = "acrpassword"
  }

  container {
    name   = "container"
    image  = "servername.azurecr.io/name:3"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

}