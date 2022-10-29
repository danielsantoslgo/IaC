provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "trfdemo2" {
  name     = "trfdemo2resources"
  location = "southeastasia"
}

resource "azurerm_mysql_server" "trfdemo2" {
  name                = "trfdemo2mysqlserver"
  location            = azurerm_resource_group.trfdemo2.location
  resource_group_name = azurerm_resource_group.trfdemo2.name

  administrator_login          = "mysqladminun"
  administrator_login_password = "set password here"

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = false
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

resource "azurerm_mysql_database" "trfdemo2" {
  name                = "trfdemo2db"
  resource_group_name = azurerm_resource_group.trfdemo2.name
  server_name         = azurerm_mysql_server.trfdemo2.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}