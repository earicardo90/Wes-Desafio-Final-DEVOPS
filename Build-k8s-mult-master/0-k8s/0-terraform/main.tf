provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "k8s_proxy" {
  ami           = var.image_id
  instance_type = "t2.medium"
  key_name      = "weslley_key"
  subnet_id     = "${element(var.subnet_public_ids, count.index)}"
  associate_public_ip_address = true
  count         = 1  
  tags = {
    Name = "wes-k8s-haproxy"
  }
  vpc_security_group_ids = [aws_security_group.acessos_workers.id]
  # depends_on = [
  #   aws_subnet.wes_sub_tf_public_a,aws_subnet.wes_sub_tf_public_c
  # ]
}


resource "aws_instance" "k8s_masters" {
  ami           = var.image_id
  instance_type = "t2.large"
  key_name      = "weslley_key"
  count         = 3
  subnet_id = "${element(var.subnet_public_ids, count.index)}"
  associate_public_ip_address = true    
  tags = {
    Name = "wes-k8s-master-${count.index}"
  }
  vpc_security_group_ids = [aws_security_group.acessos_master.id]
  # depends_on = [
  #   aws_subnet.wes_sub_tf_public_a,aws_subnet.wes_sub_tf_public_c,aws_instance.k8s_workers
  # ]
  depends_on = [
    aws_instance.k8s_workers
  ]  
}

resource "aws_instance" "k8s_workers" {
  ami           = var.image_id
  instance_type = "t2.medium"
  key_name      = "weslley_key"
  count         = 3
  subnet_id = "${element(var.subnet_public_ids, count.index)}"
  associate_public_ip_address = true
  tags = {
    Name = "wes-k8s_workers-${count.index}"
  }
  vpc_security_group_ids = [aws_security_group.acessos_workers.id]
  #   depends_on = [
  #   aws_subnet.wes_sub_tf_public_a,aws_subnet.wes_sub_tf_public_c
  # ]
}

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

output "security-group-master" {
  value = aws_security_group.acessos_master.id
}

output "subnet_priv_a" {
  value = aws_subnet.wes_sub_tf_priv_a.id
}

output "subnet_priv_c" {
  value = aws_subnet.wes_sub_tf_priv_c.id
}

output "subnet_public_a" {
  value = aws_subnet.wes_sub_tf_public_a.id
}

output "subnet_public_c" {
  value = aws_subnet.wes_sub_tf_public_c.id
}