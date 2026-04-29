output "vm_name" {
  value = azurerm_linux_virtual_machine.operator.name
}

output "private_ip_address" {
  value = azurerm_network_interface.operator.private_ip_address
}

output "public_ip_address" {
  value = var.enable_public_ip ? azurerm_public_ip.operator[0].ip_address : null
}
