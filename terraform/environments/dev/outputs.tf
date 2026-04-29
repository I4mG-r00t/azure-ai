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

output "operator_vm_name" {
  value = module.operator_vm.vm_name
}

output "operator_private_ip" {
  value = module.operator_vm.private_ip_address
}

output "operator_public_ip" {
  value = module.operator_vm.public_ip_address
}