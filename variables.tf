variable "megaport_location_1" {
  description = "Megaport Data Centre location 1"
  default     = "Equinix SY1"
}

variable "megaport_location_2" {
  description = "Megaport Data Centre location 2"
  default     = "Equinix SY3"
}

variable "megaport_mcr_1_name" {
  description = "Megaport MCR name"
  default     = "Demo MCR SYD"
}

variable "megaport_mcr_1_term" {
  description = "Megaport MCR contract term"
  default     = 1
}

variable "megaport_mcr_1_speed" {
  description = "Megaport MCR speed"
  default     = 1000
}

variable "megaport_mcr_1_asn" {
  description = "Megaport MCR BGP ASN"
  default     = 133937
}

variable "megaport_expressroute_vxc_1_name" {
  description = "Megaport ExpressRoute VXC name"
  default     = "Demo ExpressRoute VXC SYD"
}

variable "megaport_expressroute_bandwidth" {
  description = "Megaport ExpressRoute VXC bandwidth"
  default     = 50
}

variable "megaport_expressroute_vxc_1_term" {
  description = "Megaport Azure VXC term"
  default     = 1
}

variable "megaport_aws_port_location_1_name" {
  description = "AWS Direct Connect port name"
  default     = "Asia Pacific (Sydney) (ap-southeast-2)"
}

variable "megaport_aws_vxc_1_name" {
  description = "Megaport AWS VXC name"
  default     = "Demo AWS VXC SYD"
}

variable "megaport_aws_vxc_1_bandwidth" {
  description = "Megaport AWS VXC bandwidth"
  default     = 50
}

variable "megaport_aws_vxc_1_term" {
  description = "Megaport AWS VXC term"
  default     = 1
}

variable "azure_region" {
  description = "The region to create the resource group and resources in on Azure"
  default     = "Australia East"
}

variable "azure_resource_group_name" {
  description = "The name of the Azure resource group"
  default     = "demo-resource-group-syd"
}

variable "azure_virtual_network_name" {
  description = "The name of the Azure Virtual Network"
  default     = "demo-vnet-syd"
}

variable "azure_virtual_network_cidr" {
  description = "The Azure Virtual Network CIDR"
  default     = ["10.2.0.0/16"]
}

variable "azure_virtual_network_subnet_name" {
  description = "The Azure Virtual Network subnet name"
  default     = "demo-vnet-syd-subnet"
}

variable "azure_virtual_network_subnet" {
  description = "The Azure Virtual Network subnet"
  default     = ["10.2.2.0/24"]
}

variable "azure_virtual_network_gateway_subnet" {
  description = "The Azure Virtual Network Gateway subnet"
  default     = ["10.2.1.0/24"]
}

variable "azure_expressroute_name" {
  description = "The name of the Azure ExpressRoute"
  default     = "demo-expressroute-syd"
}

variable "azure_expressroute_peering_location" {
  description = "The location of the Azure ExpressRoute"
  default     = "Sydney"
}

variable "azure_expressroute_bandwidth" {
  description = "Bandwidth required on the ExpressRoute Circuit"
  default     = 50
}

variable "azure_expressroute_tier" {
  description = "Azure ExpressRoute Tier - Local/Standard/Premium"
  default     = "Standard"
}

variable "azure_expressroute_family" {
  description = "Azure ExpressRoute Family - MeteredData/Unlimited"
  default     = "MeteredData"
}

variable "azure_express_route_circuit_vlan" {
  description = "Azure ExpressRoute VLAN"
  default     = 100
}

variable "azure_express_route_circuit_primary_subnet" {
  description = "Azure ExpressRoute primary subnet"
  default     = "192.168.100.0/30"
}

variable "azure_express_route_circuit_secondary_subnet" {
  description = "Azure ExpressRoute secondary subnet"
  default     = "192.168.100.4/30"
}

variable "megaport_azure_bgp_password" {
  description = "Azure ExpresRoute BGP Password"
  default     = "password"
}

variable "azure_er_gateway_public_ip_name" {
  description = "The name of the Azure Virtual Network Gateway Public IP"
  default     = "demo-er-gw-syd-public-ip"
}

variable "azure_er_gateway_name" {
  description = "The name of the Azure Virtual Network Gateway"
  default     = "demo-er-gw-syd"
}

variable "azure_er_gateway_sku" {
  description = "The SKU of the Azure Virtual Network Gateway"
  default     = "Standard"
}

variable "azure_virtual_network_gateway_connection_name" {
  description = "The name of the Azure Virtual Network Gateway Connection to ExpressRoute"
  default     = "demo-connection-syd"
}

variable "azure_vpn_gateway_public_ip_name" {
  description = "The name of the Azure Virtual Network Gateway Public IP"
  default     = "demo-vpn-gw-syd-public-ip"
}

variable "azure_vpn_gateway_name" {
  description = "The name of the Azure Virtual Network Gateway"
  default     = "demo-vpn-gw-syd"
}

variable "azure_vpn_gateway_sku" {
  description = "The SKU of the Azure Virtual Network Gateway"
  default     = "VpnGw2"
}

variable "azure_vpn_gateway_gen" {
  description = "The Generation of the Azure Virtual Network Gateway"
  default     = "Generation2"
}

variable "aws_account_id" {
  description = "AWS Account ID"
  default     = "370553169139"
}

variable "aws_region" {
  description = "The AWS region to create resources in."
  default     = "ap-southeast-2"
}

variable "aws_vpc_name" {
  description = "The name for the AWS VPC."
  default     = "Demo-VPC-SYD"
}

variable "aws_vpc_cidr" {
  description = "The CIDR block for the AWS VPC."
  default     = "10.0.0.0/16"
}

variable "aws_subnet_name" {
  description = "The name for the AWS VPC Subnet."
  default     = "Demo-VPC-SYD-Subnet"
}

variable "aws_route_table_name" {
  description = "The name for the AWS VPC Route Table."
  default     = "Demo-VPC-SYD-Route-Table"
}

variable "aws_vpn_gateway_name" {
  description = "The name of the AWS VPN Gateway."
  default     = "Demo-VGW-SYD"
}

variable "aws_dx_gateway_name" {
  description = "The name of the AWS Direct Connect Gateway."
  default     = "Demo-DGW-SYD"
}

variable "aws_dx_gateway_asn" {
  description = "The ASN to be configured on the AWS Direct Connect Gateway."
  default     = "64512"
}
