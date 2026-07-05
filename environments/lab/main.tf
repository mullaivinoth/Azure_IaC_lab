# Resources will be added here via imports.
# Starting empty — imports come after 'terraform init' succeeds.
# ============================================================
# Wave 1: Foundation resources
# Resource Group, Virtual WAN, Virtual Hub, Virtual Network
# ============================================================

resource "azurerm_resource_group" "lab" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_virtual_wan" "lab" {
  name                = "vwan-lab-CIND-01"
  resource_group_name = azurerm_resource_group.lab.name
  location            = azurerm_resource_group.lab.location
  tags                = var.tags
}

resource "azurerm_virtual_hub" "lab" {
  name                = "vhub-lab-cind-01"
  resource_group_name = azurerm_resource_group.lab.name
  location            = azurerm_resource_group.lab.location
  virtual_wan_id      = azurerm_virtual_wan.lab.id
  address_prefix      = "10.100.0.0/24"
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_virtual_network" "bastion" {
  name                = "vnet-bastion-lab"
  resource_group_name = azurerm_resource_group.lab.name
  location            = azurerm_resource_group.lab.location
  address_space       = ["10.101.0.0/16"]
  tags                = var.tags
}
# ============================================================
# Wave 2: Subnets, NSG, Public IP
# ============================================================

resource "azurerm_subnet" "default" {
  name                            = "default"
  resource_group_name             = azurerm_resource_group.lab.name
  virtual_network_name            = azurerm_virtual_network.bastion.name
  address_prefixes                = ["10.101.0.0/26"]
  default_outbound_access_enabled = false
}

resource "azurerm_subnet" "bastion" {
  name                            = "bastion_subnet"
  resource_group_name             = azurerm_resource_group.lab.name
  virtual_network_name            = azurerm_virtual_network.bastion.name
  address_prefixes                = ["10.101.64.0/26"]
  default_outbound_access_enabled = false
}

resource "azurerm_network_security_group" "linux_vm" {
  name                = "vm-linux-lab-01-nsg"
  resource_group_name = azurerm_resource_group.lab.name
  location            = azurerm_resource_group.lab.location
  tags                = var.tags
  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_network_security_rule" "ssh" {
  name                        = "SSH"
  resource_group_name         = azurerm_resource_group.lab.name
  network_security_group_name = azurerm_network_security_group.linux_vm.name
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "122.171.19.222"
  destination_address_prefix  = "*"
  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_public_ip" "linux_vm" {
  name                = "vm-linux-lab-pip"
  resource_group_name = azurerm_resource_group.lab.name
  location            = azurerm_resource_group.lab.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
  lifecycle {
    prevent_destroy = true
  }
}
# ============================================================
# Wave 3: Hub-to-VNet Connection
# ============================================================

resource "azurerm_virtual_hub_connection" "bastion_to_hub" {
  name                      = "con-vnet-bastion-to-Vhub-lab-cin-01"
  virtual_hub_id            = azurerm_virtual_hub.lab.id
  remote_virtual_network_id = azurerm_virtual_network.bastion.id
  internet_security_enabled = true
}
# ============================================================
# Wave 5: New subnet (demo change)
# ============================================================

resource "azurerm_subnet" "app" {
  name                            = "snet-app"
  resource_group_name             = azurerm_resource_group.lab.name
  virtual_network_name            = azurerm_virtual_network.bastion.name
  address_prefixes                = ["10.101.1.0/26"]
  default_outbound_access_enabled = false
}
resource "azurerm_subnet" "db" {
  name                            = "snet-db"
  resource_group_name             = azurerm_resource_group.lab.name
  virtual_network_name            = azurerm_virtual_network.bastion.name
  address_prefixes                = ["10.101.2.0/26"]
  default_outbound_access_enabled = false
}