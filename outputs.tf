output "rnd" {
  value = random_id.rnd
}

output "rg_basic" {
  value = azurerm_resource_group.rg-basic.name
}

output "st_storage" {
  value = azurerm_storage_account.st-basic.name
}

output "app_svc_plan" {
  value = azurerm_app_service_plan.appsvcplan.name
}

output "function_app" {
  value = azurerm_function_app.functionapp.name
}

