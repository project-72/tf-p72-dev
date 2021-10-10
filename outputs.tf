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
  value = azurerm.app_svc_plan.
}

output "function_app" {
  
}

