

provider "azurerm" {
  features {}
}

# Create a random id
resource "random_id" "rnd" {
  byte_length = 2
}

resource "azurerm_resource_group" "rg-basic" {
  name     = "rg-basics-${lookup(var.project_name, var.env)}"
  location = "${var.location}"
}

resource "azurerm_storage_account" "st-basic" {
  name                     = "storageacct${lookup(var.project_name, var.env)}"
  resource_group_name      = azurerm_resource_group.rg-basic.name
  location                 = azurerm_resource_group.rg-basic.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action = "Deny"
    ip_rules       = ["23.45.1.0/30"]
  }
}
