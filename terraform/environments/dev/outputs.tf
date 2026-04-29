output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "location" {
  value = azurerm_resource_group.main.location
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "operator_subnet_name" {
  value = module.network.operator_subnet_name
}