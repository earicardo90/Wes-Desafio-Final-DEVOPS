resource "aws_subnet" "wes_sub_tf_public_a" {
  vpc_id            = var.vpc_id
  cidr_block        = "172.20.160.0/20"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "wes_sub_tf_public_a"
  }
}

resource "aws_subnet" "wes_sub_tf_public_c" {
  vpc_id            = var.vpc_id
  cidr_block        = "172.20.192.0/20"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "wes_sub_tf_public_c"
  }
}

resource "aws_route_table" "rt_wes_tf_public" {
  vpc_id = var.vpc_id

  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = var.internet_gw
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = ""
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]

  tags = {
    Name = "rt_wes_tf_public"
  }
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.wes_sub_tf_public_a.id
  route_table_id = aws_route_table.rt_wes_tf_public.id
}

resource "aws_route_table_association" "public_c" {
  subnet_id      = aws_subnet.wes_sub_tf_public_c.id
  route_table_id = aws_route_table.rt_wes_tf_public.id
}