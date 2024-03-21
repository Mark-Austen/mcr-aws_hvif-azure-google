resource "aws_vpc" "aws_vpc_sin" {
  cidr_block = var.aws_vpc_cidr
  
  tags = {
    Name = var.aws_vpc_name
  }
}

resource "aws_subnet" "aws_subnet_sin" {
  vpc_id                  = aws_vpc.aws_vpc_sin.id
  cidr_block              = aws_vpc.aws_vpc_sin.cidr_block
  map_public_ip_on_launch = false

  tags = {
    Name = var.aws_subnet_name
  }
}

resource "aws_route_table" "aws_route_table_sin" {
  vpc_id = aws_vpc.aws_vpc_sin.id

  tags = {
    Name = var.aws_route_table_name
  }
}

resource "aws_route_table_association" "aws_vpc_sin_route_table_association" {
  subnet_id      = aws_subnet.aws_subnet_sin.id
  route_table_id = aws_route_table.aws_route_table_sin.id
}

resource "aws_vpn_gateway" "aws_vpn_gateway_sin" {
  vpc_id = aws_vpc.aws_vpc_sin.id

  tags = {
    Name = var.aws_vpn_gateway_name
  }
}

resource "aws_vpn_gateway_route_propagation" "vpn_gateway_route_propagation" {
  vpn_gateway_id = aws_vpn_gateway.aws_vpn_gateway_sin.id
  route_table_id = aws_route_table.aws_route_table_sin.id
}

resource "aws_dx_gateway" "dx_gateway" {
  name            = var.aws_dx_gateway_name
  amazon_side_asn = var.aws_dx_gateway_asn
}

resource "aws_dx_gateway_association" "dx_gateway_association" {
  dx_gateway_id         = aws_dx_gateway.dx_gateway.id
  associated_gateway_id = aws_vpn_gateway.aws_vpn_gateway_sin.id
}

resource "aws_dx_hosted_private_virtual_interface_accepter" "dx_hosted_private_virtual_interface_accepter" {
  virtual_interface_id = megaport_aws_connection.aws_vxc.aws_id
  dx_gateway_id        = aws_dx_gateway.dx_gateway.id

  tags = {
    Side = "Accepter"
    Name = "AWS DX Accepter"
  }
}
