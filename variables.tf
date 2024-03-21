variable "megaport_location_1" {
  description = "Megaport Data Centre location 1."
  default     = "Equinix SG1"
}

variable "megaport_location_2" {
  description = "Megaport Data Centre location 2."
  default     = "Equinix SG2"
}

variable "megaport_aws_port_name" {
  description = "Name of the AWS Megaport Port."
  default     = "Asia Pacific (Singapore) (ap-southeast-1)"
}

variable "megaport_mcr_name" {
  description = "Megaport MCR Name."
  default     = "Demo MCR SIN"
}

variable "megaport_mcr_speed" {
  description = "Megaport MCR speed."
  default     = 1000
}

variable "megaport_aws_vxc_name" {
  description = "Megaport AWS VXC name"
  default     = "Demo AWS VXC SIN"
}

variable "megaport_aws_vxc_speed" {
  description = "Speed of the Megaport AWS VXC"
  default     = 100
}

variable "megaport_mcr_asn" {
  description = "MCR BGP ASN."
  default     = "133937"
}

variable "megaport_azure_vxc_name" {
  description = "Megaport Azure VXC name"
  default     = "Demo Azure VXC SIN"
}

variable "megaport_azure_vxc_vlan" {
  description = "Megaport Azure VXC VLAN"
  default     = 100
}

variable "megaport_azure_primary_subnet" {
  description = "Primary Azure ExpressRoute subnet"
  default     = "169.254.20.0/30"
}

variable "megaport_azure_secondary_subnet" {
  description = "Secondary Azure ExpressRoute subnet"
  default     = "169.254.20.4/30"
}

variable "megaport_azure_bgp_password" {
  description = "Azure ExpresRoute BGP Password"
  default     = "password"
}

variable "aws_account_id" {
  description = "AWS Account ID"
  default     = "aws_account_id"
}

variable "aws_region" {
  description = "The AWS region to create resources in."
  default     = "ap-southeast-1"
}

variable "aws_vpc_name" {
  description = "The name for the AWS VPC."
  default     = "Demo-VPC-SIN"
}

variable "aws_vpc_cidr" {
  description = "The CIDR block for the AWS VPC."
  default     = "10.0.0.0/16"
}

variable "aws_subnet_name" {
  description = "The name for the AWS VPC Subnet."
  default     = "Demo-VPC-SIN-Subnet"
}

variable "aws_route_table_name" {
  description = "The name for the AWS VPC Route Table."
  default     = "Demo-VPC-SIN-Route-Table"
}

variable "aws_vpn_gateway_name" {
  description = "The name of the AWS VPN Gateway."
  default     = "Demo-VGW-SIN"
}

variable "aws_dx_gateway_name" {
  description = "The name of the AWS Direct Connect Gateway."
  default     = "Demo-DGW-SIN"
}

variable "aws_dx_gateway_asn" {
  description = "The ASN to be configured on the AWS Direct Connect Gateway."
  default     = "64512"
}

variable "azure_region" {
  description = "The region to create the resource group and resources in on Azure."
  default     = "Southeast Asia"
}

variable "azure_resource_group_name" {
  description = "The name of the Azure resource group."
  default     = "demo-resource-group-sin"
}

variable "azure_virtual_network_name" {
  description = "The name of the Azure Virtual Network."
  default     = "demo-vnet-sin"
}

variable "azure_virtual_network_cidr" {
  description = "The Azure Virtual Network CIDR."
  default     = ["10.1.0.0/16"]
}

variable "azure_virtual_network_subnet_name" {
  description = "The Azure Virtual Network Subnet name."
  default     = "demo-vnet-sin-subnet"
}

variable "azure_virtual_network_subnet" {
  description = "The Azure Virtual Network Subnet."
  default     = ["10.1.1.0/24"]
}

variable "azure_virtual_network_gateway_subnet" {
  description = "The Azure Virtual Network Gateway Subnet."
  default     = ["10.1.2.0/24"]
}

variable "azure_expressroute_name" {
  description = "The name of the Azure ExpressRoute."
  default     = "demo-expressroute-sin"
}

variable "azure_expressroute_peering_location" {
  description = "The location of the Azure ExpressRoute."
  default     = "Singapore"
}

variable "azure_expressroute_bandwidth" {
  description = "Bandwidth required on the ExpressConnect circuit/connection."
  default     = 1000
}

variable "azure_expressroute_tier" {
  description = "Azure ExpressRoute Tier - Local/Standard/Premium."
  default     = "Standard"
}

variable "azure_expressroute_family" {
  description = "Azure ExpressRoute Family - MeteredData/Unlimited."
  default     = "MeteredData"
}

variable "azure_virtual_network_gateway_public_ip_name" {
  description = "The name of the Azure Virtual Network Gateway Public IP."
  default     = "demo-vnet-gw-sin-public-ip"
}

variable "azure_virtual_network_gateway_name" {
  description = "The name of the Azure Virtual Network Gateway."
  default     = "demo-vnet-gw-sin"
}

variable "azure_virtual_network_gateway_sku" {
  description = "The SKU of the Azure Virtual Network Gateway."
  default     = "Standard"
}

variable "azure_virtual_network_gateway_connection_name" {
  description = "The name of the Azure Virtual Network Gateway Connection to ExpressRoute."
  default     = "demo-connection-sin"
}
