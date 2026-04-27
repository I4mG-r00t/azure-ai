output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "vnet_name" {
  value = azurerm_virtual_network.main.name
}

output "operator_subnet_id" {
  value = azurerm_subnet.operator.id
}

output "operator_subnet_name" {
  value = azurerm_subnet.operator.name
}

output "operator_nsg_id" {
  value = azurerm_network_security_group.operator.id
}
