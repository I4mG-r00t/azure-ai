resource "azurerm_resource_group" "main" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location

  tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
  }
}

module "network" {
  source = "../../modules/network"

  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
}

module "operator_vm" {
  source = "../../modules/linux-operator-vm"

  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = module.network.operator_subnet_id

  admin_username = "operator"
  ssh_public_key = var.ssh_public_key

  vm_size         = "Standard_B2s"
  os_disk_size_gb = 128

  enable_public_ip = false

  image_publisher = "kali-linux" # Replace if needed
  image_offer     = "kali" # Replace if needed
  image_sku       = "kali-2026-1" # Replace if needed
  image_version   = "latest"

  custom_data = file("${path.module}/../../../cloud-init/operator-vm.yaml")
}