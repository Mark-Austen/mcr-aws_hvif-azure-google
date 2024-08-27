resource "aws_vpc" "aws_vpc_1" {
  cidr_block = var.aws_vpc_1_cidr
  
  tags = {
    Name = var.aws_vpc_1_name
  }
}

resource "aws_subnet" "aws_subnet_1" {
  vpc_id                  = aws_vpc.aws_vpc_1.id
  cidr_block              = aws_vpc.aws_vpc_1.cidr_block
  map_public_ip_on_launch = false

  tags = {
    Name = var.aws_subnet_1_name
  }
}

resource "aws_route_table" "aws_route_table_1" {
  vpc_id = aws_vpc.aws_vpc_1.id

  tags = {
    Name = var.aws_route_table_1_name
  }
}

resource "aws_route_table_association" "aws_vpc_1_route_table_association" {
  subnet_id      = aws_subnet.aws_subnet_1.id
  route_table_id = aws_route_table.aws_route_table_1.id
}

resource "aws_vpn_gateway" "aws_vpn_gateway_1" {
  vpc_id = aws_vpc.aws_vpc_1.id

  tags = {
    Name = var.aws_vpn_gateway_1_name
  }
}

resource "aws_vpn_gateway_route_propagation" "vpn_gateway_1_route_propagation" {
  vpn_gateway_id = aws_vpn_gateway.aws_vpn_gateway_1.id
  route_table_id = aws_route_table.aws_route_table_1.id
}

resource "aws_dx_gateway" "dx_gateway_1" {
  name            = var.aws_dx_gateway_1_name
  amazon_side_asn = var.aws_dx_gateway_1_asn
}

resource "aws_dx_gateway_association" "dx_gateway_association" {
  dx_gateway_id         = aws_dx_gateway.dx_gateway_1.id
  associated_gateway_id = aws_vpn_gateway.aws_vpn_gateway_1.id
}

resource "aws_dx_hosted_private_virtual_interface_accepter" "dx_hosted_private_virtual_interface_accepter_1" {
  virtual_interface_id = megaport_vxc.aws_vxc_1.csp_connections.1.vif_id
  dx_gateway_id        = aws_dx_gateway.dx_gateway_1.id

  tags = {
    Side = "Accepter"
    Name = "AWS DX Accepter"
  }
}
