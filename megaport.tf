data "megaport_location" "megaport_location_1" {
  name              = var.megaport_location_1
}

resource "megaport_mcr" "mcr_1" {
  product_name             = var.megaport_mcr_1_name
  location_id              = data.megaport_location.megaport_location_1.id
  contract_term_months     = var.megaport_mcr_1_term
  port_speed               = var.megaport_mcr_1_speed
}

resource "megaport_vxc" "expressroute_vxc_1" {
  product_name            = var.megaport_expressroute_vxc_1_name
  rate_limit              = var.azure_expressroute_bandwidth
  contract_term_months    = var.megaport_expressroute_vxc_1_term

  a_end = {
    requested_product_uid = megaport_mcr.mcr_1.product_uid
  }

  b_end = {}

  b_end_partner_config = {
    partner = "azure"
    azure_config = {
      port_choice = "primary"
      service_key = azurerm_express_route_circuit.express_route_circuit.service_key
        peers = [{
        type             = "private"
        vlan             = var.azure_express_route_circuit_vlan
        peer_asn         = var.megaport_mcr_1_asn
        primary_subnet   = var.azure_express_route_circuit_primary_subnet
        secondary_subnet = var.azure_express_route_circuit_secondary_subnet
      }]
    }
  }
}
