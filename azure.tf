resource "azurerm_resource_group" "resource_group_1" {
  name     = var.azure_resource_group_name_1
  location = var.azure_region_1
}

resource "azurerm_virtual_network" "virtual_network_1" {
  name                = var.azure_virtual_network_name_1
  location            = azurerm_resource_group.resource_group_1.location
  resource_group_name = azurerm_resource_group.resource_group_1.name
  address_space       = var.azure_virtual_network_cidr_1
}

resource "azurerm_subnet" "virtual_network_subnet_1" {
  name                 = var.azure_virtual_network_subnet_name_1
  resource_group_name  = azurerm_resource_group.resource_group_1.name
  virtual_network_name = azurerm_virtual_network.virtual_network_1.name
  address_prefixes     = var.azure_virtual_network_subnet_1
}

resource "azurerm_subnet" "gateway_subnet_1" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.resource_group_1.name
  virtual_network_name = azurerm_virtual_network.virtual_network_1.name
  address_prefixes     = var.azure_virtual_network_gateway_subnet_1
}

resource "azurerm_express_route_circuit" "express_route_circuit_1" {
  name                  = var.azure_expressroute_name_1
  resource_group_name   = azurerm_resource_group.resource_group_1.name
  location              = azurerm_resource_group.resource_group_1.location
  service_provider_name = "Megaport"
  peering_location      = var.azure_expressroute_peering_location_1
  bandwidth_in_mbps     = var.azure_expressroute_bandwidth_1

  sku {
    tier   = var.azure_expressroute_tier
    family = var.azure_expressroute_family
  }
}

resource "azurerm_public_ip" "er_gateway_public_ip_1" {
  name                = var.azure_er_gateway_public_ip_name_1
  location            = azurerm_resource_group.resource_group_1.location
  resource_group_name = azurerm_resource_group.resource_group_1.name
    
  sku               = "Standard"
  allocation_method = "Static"
}

resource "azurerm_virtual_network_gateway" "er_gateway_1" {
  name                = var.azure_er_gateway_name_1
  location            = azurerm_resource_group.resource_group_1.location
  resource_group_name = azurerm_resource_group.resource_group_1.name

  type = "ExpressRoute"

  active_active = false
  enable_bgp    = true
  sku           = var.azure_er_gateway_sku

  ip_configuration {
    name                          = "erGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.er_gateway_public_ip_1.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway_subnet_1.id
  }
}

resource "azurerm_virtual_network_gateway_connection" "virtual_network_gateway_connection_1" {
  name                = var.azure_virtual_network_gateway_connection_name_1
  location            = azurerm_resource_group.resource_group_1.location
  resource_group_name = azurerm_resource_group.resource_group_1.name

  type                       = "ExpressRoute"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.er_gateway_1.id
  express_route_circuit_id   = azurerm_express_route_circuit.express_route_circuit_1.id
}
