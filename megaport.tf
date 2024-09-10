data "megaport_location" "megaport_location_1" {
  name              = var.megaport_location_1
}

data "megaport_location" "megaport_location_2" {
  name              = var.megaport_location_2
}

data "megaport_partner" "aws_port_location_1" {
  connect_type       = "AWS"
  company_name       = "AWS"
  product_name       = var.megaport_aws_port_location_1_name
  location_id        = data.megaport_location.megaport_location_2.id
}

resource "megaport_mcr" "mcr_1" {
  product_name             = var.megaport_mcr_1_name
  location_id              = data.megaport_location.megaport_location_1.id
  contract_term_months     = var.megaport_mcr_1_term
  port_speed               = var.megaport_mcr_1_speed
}

resource "megaport_vxc" "expressroute_vxc_1" {
  product_name            = var.megaport_expressroute_vxc_1_name
  rate_limit              = var.azure_expressroute_bandwidth_1
  contract_term_months    = var.megaport_expressroute_vxc_1_term

  a_end = {
    requested_product_uid = megaport_mcr.mcr_1.product_uid
  }

  b_end = {}

  b_end_partner_config = {
    partner = "azure"
    azure_config = {
      port_choice = "primary"
      service_key = azurerm_express_route_circuit.express_route_circuit_1.service_key
        peers = [{
        type             = "private"
        vlan             = var.azure_express_route_circuit_vlan_1
        peer_asn         = var.megaport_mcr_1_asn
        primary_subnet   = var.azure_express_route_circuit_primary_subnet_1
        secondary_subnet = var.azure_express_route_circuit_secondary_subnet_1
      }]
    }
  }
}

resource "megaport_vxc" "aws_vxc_1" {
  product_name         = var.megaport_aws_vxc_1_name
  rate_limit           = var.megaport_aws_vxc_1_bandwidth
  contract_term_months = var.megaport_aws_vxc_1_term

  a_end = {
    requested_product_uid = megaport_mcr.mcr_1.product_uid
  }

  b_end = {
    requested_product_uid = data.megaport_partner.aws_port_location_1.product_uid
  }

  b_end_partner_config = {
    partner = "aws"
    aws_config = {
      name          = var.megaport_aws_vxc_1_name
      asn           = var.megaport_mcr_1_asn
      type          = "private"
      connect_type  = "AWS"
      amazon_asn    = var.aws_dx_gateway_1_asn
      owner_account = var.aws_account_id
    }
  }
}

resource "megaport_vxc" "google_vxc_1" {
  product_name         = "Google VXC"
  rate_limit           = 50
  contract_term_months = 1

  a_end = {
    requested_product_uid = megaport_mcr.mcr_1.product_uid
  }

  b_end = {}

  b_end_partner_config = {
    partner = "google"
    google_config = {
      pairing_key = google_compute_interconnect_attachment.vlan_attach_1.pairing_key
    }
  }
}
