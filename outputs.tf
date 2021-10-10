output "rg_basic" {
  value = azurerm_resource_group.rg-basic.name
}

output "rg_storage" {
  value = azurerm_storage_account.st-basic.name
}
