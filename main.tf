

provider "azurerm" {
  features {}
}

# Create a random id
resource "random_id" "rnd" {
  byte_length = 2
}

resource "azurerm_resource_group" "rg-basic" {
  name     = "${var.prefix}rg-basics-${lookup(var.project_name, var.env)}"
  location = "${var.location}"
}

resource "azurerm_storage_account" "st-basic" {
  name                     = "${var.prefix}storageacct${random_id.rnd.hex}${lookup(var.project_name, var.env)}"
  resource_group_name      = azurerm_resource_group.rg-basic.name
  location                 = azurerm_resource_group.rg-basic.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action = "Deny"
    ip_rules       = ["23.45.1.0/30"]
  }
}

resource "azurerm_application_insights" "appinsights" {
  name                = "${var.prefix}-appinsights"
  resource_group_name = azurerm_resource_group.rg-basic.name
  location            = azurerm_resource_group.rg-basic.location
  application_type    = "web"
}

resource "azurerm_app_service_plan" "appsvcplan" {
  name                = "${var.prefix}-appsvcplan-${lookup(var.project_name, var.env)}"
  resource_group_name = azurerm_resource_group.rg-basic.name
  location            = azurerm_resource_group.rg-basic.location
  kind                = "FunctionApp"

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "functionapp" {
  name                      = "${var.prefix}-functionapp-${lookup(var.project_name, var.env)}"
  resource_group_name       = azurerm_resource_group.rg-basic.name
  location                  = azurerm_resource_group.rg-basic.location
  app_service_plan_id       = azurerm_app_service_plan.appsvcplan.id
  storage_account_name      = azurerm_storage_account.st-basic.name
  storage_account_access_key = azurerm_storage_account.st-basic.primary_access_key
  version                   = "~3"
  kind                      = "functionapp"
  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "",
    "FUNCTIONS_WORKER_RUNTIME" = "node",
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.appinsights.instrumentation_key,
  }
  os_type = "linux"
  site_config {
    linux_fx_version          = "node|14"
    use_32_bit_worker_process = false
  }
}
