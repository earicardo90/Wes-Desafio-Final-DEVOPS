provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "k8s_proxy" {
  ami           = var.image_id
  instance_type = "t2.micro"
  key_name      = "weslley_key"
  subnet_id     = element(var.subnet_ids, count.index)
  associate_public_ip_address = true
  # root_block_device {
  #   encrypted   = true
  #   volume_size = 8
  # }
  count         = 1  
  tags = {
    Name = "wes-k8s-haproxy"
  }
  vpc_security_group_ids = [aws_security_group.acessos_workers.id]
}

resource "aws_instance" "k8s_masters" {
  ami           = var.image_id
  instance_type = "t2.large"
  key_name      = "weslley_key"
  count         = 3
  subnet_id = element(var.subnet_ids, count.index)
  associate_public_ip_address = true  
  # root_block_device {
  #   encrypted   = true
  #   volume_size = 10
  # }    
  tags = {
    Name = "wes-k8s-master-${count.index}"
  }
  vpc_security_group_ids = [aws_security_group.acessos_master.id]
  depends_on = [
    aws_instance.k8s_workers,
  ]
}

resource "aws_instance" "k8s_workers" {
  ami           = var.image_id
  instance_type = "t2.medium"
  key_name      = "weslley_key"
  count         = 3
  subnet_id = element(var.subnet_ids, count.index)
  associate_public_ip_address = true
  # root_block_device {
  #   encrypted   = true
  #   volume_size = 15
  # }
  tags = {
    Name = "wes-k8s_workers-${count.index}"
  }
  vpc_security_group_ids = [aws_security_group.acessos_workers.id]
}

# resource "aws_eip" "wes_eip" {
  
# }
# resource "aws_nat_gateway" "nat_gatway" {
#   allocation_id = aws_eip.wes_eip.id
#   subnet_id     = "subnet-0341d478f8cd667a3"

#   tags = {
#     Name = "Wes-gw-NAT"
#   }

# }
# resource "aws_route_table" "nat_gateway" {
#   vpc_id = "vpc-0050d085a3350c2c9"
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = "igw-054a2658906c6a922"
#   }
# }

# resource "aws_route_table_association" "nat_gateway" {
#   subnet_id = "subnet-0a7b85eab03329d31"
#   route_table_id = aws_route_table.nat_gateway.id
# }
output "k8s-masters" {
  value = [
    for key, item in aws_instance.k8s_masters :
      "k8s-master ${key+1} - ${item.private_ip} - ssh -i ~/.ssh/weslley_itau_rsa -o ServerAliveInterval=60 -o StrictHostKeyChecking=no ubuntu@${item.public_dns} "
  ]
}

output "output-k8s_workers" {
  value = [
    for key, item in aws_instance.k8s_workers :
      "k8s-workers ${key+1} - ${item.private_ip} - ssh -i ~/.ssh/weslley_itau_rsa -o ServerAliveInterval=60 -o StrictHostKeyChecking=no ubuntu@${item.public_dns} "
  ]
}

output "output-k8s_proxy" {
  value = [
    for key, item in aws_instance.k8s_proxy :
      "k8s-proxy ${key+1} - ${item.private_ip} - ssh -i ~/.ssh/weslley_itau_rsa -o ServerAliveInterval=60 -o StrictHostKeyChecking=no ubuntu@${item.public_dns} "
  ]
}

output "security-group-workers-e-haproxy" {
  value = aws_security_group.acessos_workers.id
}



# terraform refresh para mostrar o ssh
