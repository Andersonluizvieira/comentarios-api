provider "azurerm" {
  features {}
}

# Grupo de Recursos
resource "azurerm_resource_group" "example" {
  name     = "Lab Anderson"
  location = "East US"
}

# Rede Virtual
resource "azurerm_virtual_network" "example_vnet" {
  name                = "vnet-lab-devops-eastus"
  location            = "East US"
  address_space        = ["10.124.0.0/16"]
  resource_group_name = azurerm_resource_group.example.name
}

# Sub-rede
resource "azurerm_subnet" "lab-devops_subnet" {
  name                 = "snet-lab-devops-eastus"
  virtual_network_name = azurerm_virtual_network.example_vnet.name
  resource_group_name  = azurerm_resource_group.example.name
}

# Máquina Virtual (Ubuntu 22.04)
resource "azurerm_linux_virtual_machine" "lab_vm" {
  name                = "vm-comentarios-api"
  resource_group_name = azurerm_resource_group.example.name
  location            = "East US"
  size                = "Standard_B2s"  # Tamanho da VM (2 vCPUs, 4 GiB de memória)
  admin_username      = "atalanta"
  admin_password      = "password123"
  network_interface_ids = [
    azurerm_network_interface.example_nic.id,
  ]
  os_disk {
    name              = "example-os-disk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "22.04-LTS"  # Sistema operacional Ubuntu 22.04
    version   = "latest"
  }

  tags = {
    environment = "production"
  }
}

# Interface de Rede
resource "azurerm_network_interface" "example_nic" {
  name                = "lab-devops-nic"
  location            = "East US"
  resource_group_name = azurerm_resource_group.example.name
  subnet_id           = azurerm_subnet.lab-devops_subnet.id
}

# IP Público
resource "azurerm_public_ip" "example_ip" {
  name                = "lab-devops-public-ip"
  location            = "East US"
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
}

# Output do IP Público
output "public_ip" {
  value = azurerm_public_ip.example_ip.ip_address
}

# Exemplo de Saída do ID da Máquina Virtual
output "vm_id" {
  value = azurerm_linux_virtual_machine.lab_vm.id
}

