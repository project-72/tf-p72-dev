output "rg_basic" {
  value = azure_resource_group.rg-basic.name
}

output "rg_storage" {
  value = azure_storage_account.st-basic.name
}
