# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.80.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Create a random id
resource "random_id" "rnd" {
  byte_length = 2
}

resource "azurerm_resource_group" "rg-${var.prefix}basics-${random_id.rnd}-${lookup(var.project_name, var.env)}" {
  name     = "${var.prefix}-rg-basics-${lookup(var.project_name, var.env)}"
  location = "${var.location}"
}

resource "azurerm_storage_account" "st-basic" {
  name                     = "st${var.prefix}storageacct-${random_id.rnd}${lookup(var.project_name, var.env)}"
  resource_group_name      = azurerm_resource_group.example-rg.name
  location                 = azurerm_resource_group.example-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action = "Deny"
    ip_rules       = ["23.45.1.0/30"]
  }
}
