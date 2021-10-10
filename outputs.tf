output "rg_basic" {
  value = azurerm_resource_group.rg-basic.name
}

output "st_storage" {
  value = azurerm_storage_account.st-basic.name
}

output "rnd" {
  value = random_id.rnd
}
