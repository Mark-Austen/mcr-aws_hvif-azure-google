data "megaport_location" "megaport_location_1" {
  name              = var.megaport_location_1
}

data "megaport_location" "megaport_location_2" {
  name              = var.megaport_location_2
}

data "megaport_partner_port" "aws_port_location_1" {
  connect_type       = "AWS"
  company_name       = "AWS"
  product_name       = var.megaport_aws_port_name
  location_id        = data.megaport_location.megaport_location_2.id
}

resource "megaport_mcr" "mcr" {
  mcr_name          = var.megaport_mcr_name
  location_id       = data.megaport_location.megaport_location_1.id

  router {
    port_speed      = var.megaport_mcr_speed
  }
}

resource "megaport_aws_connection" "aws_vxc" {
  vxc_name                            = var.megaport_aws_vxc_name
  rate_limit                          = var.megaport_aws_vxc_speed

  a_end {
    port_id                           = megaport_mcr.mcr.id
    requested_vlan                    = 0
  }

  csp_settings {
    requested_product_id              = data.megaport_partner_port.aws_port_location_1.id
    requested_asn                     = var.megaport_mcr_asn
    amazon_asn                        = var.aws_dx_gateway_asn
    amazon_account                    = var.aws_account_id
  }
}

resource "megaport_azure_connection" "azure_vxc" {
  vxc_name   = var.megaport_azure_vxc_name
  rate_limit = var.azure_expressroute_bandwidth

  a_end {
    port_id        = megaport_mcr.mcr.id
    requested_vlan = var.megaport_azure_vxc_vlan
  }

  csp_settings {
    service_key                   = azurerm_express_route_circuit.express_route_circuit.service_key
    auto_create_private_peering   = true
    auto_create_microsoft_peering = false

  private_peering {
    peer_asn         = var.megaport_mcr_asn
    primary_subnet   = var.megaport_azure_primary_subnet
    secondary_subnet = var.megaport_azure_secondary_subnet
    shared_key       = var.megaport_azure_bgp_password
    requested_vlan   = var.megaport_azure_vxc_vlan
    }  
  }
}
