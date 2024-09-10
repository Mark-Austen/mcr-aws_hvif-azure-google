// Megaport variables

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

variable "megaport_mcr_1_diversity_zone" {
  description = "MCR Diversity Zone"
  default     = "red"
}

variable "megaport_aws_port_location_1_name" {
  description = "AWS Direct Connect port name"
  default     = "Asia Pacific (Sydney) (ap-southeast-2)"
}

variable "megaport_aws_vxc_1_name" {
  description = "Megaport AWS VXC name"
  default     = "Demo AWS Hosted VIF VXC SYD"
}

variable "megaport_aws_vxc_1_bandwidth" {
  description = "Megaport AWS VXC bandwidth"
  default     = 50
}

variable "megaport_aws_vxc_1_term" {
  description = "Megaport AWS VXC term"
  default     = 1
}

// AWS variables

variable "aws_account_id" {
  description = "AWS Account ID"
  default     = "<aws account ID>"
}

variable "aws_region_1" {
  description = "The AWS region to create resources in."
  default     = "ap-southeast-2"
}

variable "aws_vpc_1_name" {
  description = "The name for the AWS VPC."
  default     = "Demo-VPC-SYD"
}

variable "aws_vpc_1_cidr" {
  description = "The CIDR block for the AWS VPC."
  default     = "10.1.0.0/16"
}

variable "aws_subnet_1_name" {
  description = "The name for the AWS VPC Subnet."
  default     = "Demo-VPC-SYD-Subnet"
}

variable "aws_route_table_1_name" {
  description = "The name for the AWS VPC Route Table."
  default     = "Demo-VPC-SYD-Route-Table"
}

variable "aws_vpn_gateway_1_name" {
  description = "The name of the AWS VPN Gateway."
  default     = "Demo-VGW-SYD"
}

variable "aws_dx_gateway_1_name" {
  description = "The name of the AWS Direct Connect Gateway."
  default     = "Demo-DGW-SYD"
}

variable "aws_dx_gateway_1_asn" {
  description = "The ASN to be configured on the AWS Direct Connect Gateway."
  default     = "64512"
}

// Azure variables

variable "azure_resource_group_name_1" {
  description = "The name of the Azure resource group"
  default     = "demo-resource-group-syd"
}

variable "azure_region_1" {
  description = "The region to create the resource group and resources in on Azure"
  default     = "Australia East"
}

variable "azure_virtual_network_name_1" {
  description = "The name of the Azure Virtual Network"
  default     = "demo-vnet-syd"
}

variable "azure_virtual_network_cidr_1" {
  description = "The Azure Virtual Network CIDR"
  default     = ["10.2.0.0/16"]
}

variable "azure_virtual_network_subnet_name_1" {
  description = "The Azure Virtual Network subnet name"
  default     = "demo-vnet-syd-subnet"
}

variable "azure_virtual_network_subnet_1" {
  description = "The Azure Virtual Network subnet"
  default     = ["10.2.2.0/24"]
}

variable "azure_virtual_network_gateway_subnet_1" {
  description = "The Azure Virtual Network Gateway subnet"
  default     = ["10.2.1.0/24"]
}

variable "azure_expressroute_name_1" {
  description = "The name of the Azure ExpressRoute"
  default     = "demo-expressroute-syd"
}

variable "azure_expressroute_peering_location_1" {
  description = "The location of the Azure ExpressRoute"
  default     = "Sydney"
}

variable "azure_expressroute_bandwidth_1" {
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

variable "azure_express_route_circuit_vlan_1" {
  description = "Azure ExpressRoute VLAN"
  default     = 100
}

variable "azure_express_route_circuit_primary_subnet_1" {
  description = "Azure ExpressRoute primary subnet"
  default     = "192.168.100.0/30"
}

variable "azure_express_route_circuit_secondary_subnet_1" {
  description = "Azure ExpressRoute secondary subnet"
  default     = "192.168.100.4/30"
}

variable "megaport_azure_bgp_password" {
  description = "Azure ExpresRoute BGP Password"
  default     = "password"
}

variable "azure_er_gateway_public_ip_name_1" {
  description = "The name of the Azure Virtual Network Gateway Public IP"
  default     = "demo-er-gw-syd-public-ip"
}

variable "azure_er_gateway_name_1" {
  description = "The name of the Azure Virtual Network Gateway"
  default     = "demo-er-gw-syd"
}

variable "azure_er_gateway_sku" {
  description = "The SKU of the Azure Virtual Network Gateway"
  default     = "Standard"
}

// Google Cloud Variables

variable "google_region_1_name" {
  description = "Google Cloud region name."
  default     = "australia-southeast1"
}

variable "google_vpc_1_name" {
  description = "The name for the Google Cloud VPC."
  default     = "demo-vpc-sydney"
}

variable "google_subnet_1_name" {
  description = "The name for the Google Cloud VPC Subnet."
  default     = "subnet-1"
}

variable "google_vpc_1_cidr" {
  description = "The CIDR block for the Google Cloud VPC."
  default     = "10.3.0.0/16"
}

variable "google_cloud_router_1_name" {
  description = "Google Cloud router name."
  default     = "demo-cloud-router-syd"
}

variable "google_interconnect_attachment_1_name" {
  description = "Google Cloud Interconnect Attachment name"
  default     = "syd-attachment-1"
}

variable "azure_virtual_network_gateway_connection_name_1" {
  description = "The name of the Azure Virtual Network Gateway Connection to ExpressRoute"
  default     = "demo-connection-syd"
}
