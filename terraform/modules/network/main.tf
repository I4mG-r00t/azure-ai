resource "azurerm_virtual_network" "main" {
  name                = "vnet-${var.project_name}-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space

  tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
  }
}

resource "azurerm_subnet" "operator" {
  name                 = "snet-operator-${var.environment}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.operator_subnet_prefixes
}

resource "azurerm_network_security_group" "operator" {
  name                = "nsg-operator-${var.project_name}-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
  }
}

resource "azurerm_subnet_network_security_group_association" "operator" {
  subnet_id                 = azurerm_subnet.operator.id
  network_security_group_id = azurerm_network_security_group.operator.id
}
