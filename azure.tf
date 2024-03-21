resource "azurerm_resource_group" "resource_group" {
  name     = var.azure_resource_group_name
  location = var.azure_region
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = var.azure_virtual_network_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  address_space       = var.azure_virtual_network_cidr
}

resource "azurerm_subnet" "virtual_network_subnet" {
  name                 = var.azure_virtual_network_subnet_name
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = var.azure_virtual_network_subnet
}

resource "azurerm_subnet" "gateway_subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = var.azure_virtual_network_gateway_subnet
}

resource "azurerm_express_route_circuit" "express_route_circuit" {
  name                  = var.azure_expressroute_name
  resource_group_name   = azurerm_resource_group.resource_group.name
  location              = azurerm_resource_group.resource_group.location
  service_provider_name = "Megaport"
  peering_location      = var.azure_expressroute_peering_location
  bandwidth_in_mbps     = var.azure_expressroute_bandwidth

  sku {
    tier   = var.azure_expressroute_tier
    family = var.azure_expressroute_family
  }
}

resource "azurerm_public_ip" "public_ip" {
  name                = var.azure_virtual_network_gateway_public_ip_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
    
  sku               = "Standard"
  allocation_method = "Static"
}

resource "azurerm_virtual_network_gateway" "virtual_network_gateway" {
  name                = var.azure_virtual_network_gateway_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  type = "ExpressRoute"

  active_active = false
  enable_bgp    = true
  sku           = var.azure_virtual_network_gateway_sku

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway_subnet.id
  }
}

resource "azurerm_virtual_network_gateway_connection" "virtual_network_gateway_connection" {
  name                = var.azure_virtual_network_gateway_connection_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  type                       = "ExpressRoute"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.virtual_network_gateway.id
  express_route_circuit_id   = azurerm_express_route_circuit.express_route_circuit.id

  enable_bgp = true
}
