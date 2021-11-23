resource "aws_subnet" "wes_sub_tf_priv_a" {
  vpc_id            = var.vpc_id
  cidr_block        = "172.20.112.0/20"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "wes_sub_tf_priv_a"
  }
}

resource "aws_subnet" "wes_sub_tf_priv_c" {
  vpc_id            = var.vpc_id
  cidr_block        = "172.20.144.0/20"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "wes_sub_tf_priv_c"
  }
}

resource "aws_route_table" "rt_wes_tf_priv" {
  vpc_id = var.vpc_id

  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = ""
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = aws_nat_gateway.nat_gatway.id
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]

  tags = {
    Name = "rt_wes_tf_priv"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.wes_sub_tf_priv_a.id
  route_table_id = aws_route_table.rt_wes_tf_priv.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.wes_sub_tf_priv_c.id
  route_table_id = aws_route_table.rt_wes_tf_priv.id
}