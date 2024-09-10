resource "google_compute_network" "vpc_network_1" {
  name          = var.google_vpc_1_name
  routing_mode  = "GLOBAL"
}

resource "google_compute_subnetwork" "subnet_1" {
  name          = var.google_subnet_1_name
  ip_cidr_range = var.google_vpc_1_cidr
  network       = google_compute_network.vpc_network_1.id
}

resource "google_compute_router" "cloud_router_1" {
  name                          = var.google_cloud_router_1_name
  network                       = google_compute_network.vpc_network_1.name
  bgp {
    asn = 16550
  }
}

resource "google_compute_interconnect_attachment" "vlan_attach_1" {
  name          = var.google_interconnect_attachment_1_name
  router        = google_compute_router.cloud_router_1.id
  type          = "PARTNER"
  region        = var.google_region_1_name
  admin_enabled = true
  edge_availability_domain = "AVAILABILITY_DOMAIN_1" // single attachment
}
