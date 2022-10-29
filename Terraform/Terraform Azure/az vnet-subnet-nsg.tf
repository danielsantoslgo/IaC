resource "azurerm_resource_group" "rg" {
  name     = "TF-LAN"
  location =  "west-us"  
}

resource "azurerm_network_security_group" "nsg" {
  name                = "TF-LAN-NSG-1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_virtual_network" "vnet-1" {
  name                = "TF-LAN-VNET-1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["172.0.0.0/16"]
 
}

resource "azurerm_subnet" "server-subnet-1" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-1.name
  address_prefixes     = ["172.0.1.0/24"]