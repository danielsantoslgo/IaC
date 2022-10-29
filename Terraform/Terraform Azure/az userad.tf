provider "azurerm" {
  features {}
}

resource "azuread_user" "example" {
  user_principal_name = "mtest@ntweekly.local"
  display_name        = "My Test"
  mail_nickname       = "mtest"
  password            = "set password"
}
