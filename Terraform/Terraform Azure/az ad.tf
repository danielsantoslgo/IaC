terraform {
required_providers {
azuread = {
source = "hashicorp/azuread"
version = "1.0.0"
}
}
}

provider "azuread" {
# Configuration options
}
resource "azuread_group" "terraformadmins"{
name = "Terrafrom Admins"
description = "An Azure AD Group for Terraform administrators"
prevent_duplicate_names = true
}