# Azure Terraform setup - Placeholder
provider "azurerm" {
  features {}
}

resource "azurerm_postgresql_flexible_server" "example" {
  name                   = "todopgserver"
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = var.admin_user
  administrator_password = var.admin_password
  version                = "15"

  storage_mb             = 32768
  sku_name               = "GP_Standard_D2s_v3"
}
