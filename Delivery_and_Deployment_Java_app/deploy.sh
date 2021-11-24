#!/bin/bash

terraform init
terraform apply -auto-approve

echo  "Aguardando a criação das maquinas ..."
sleep 20

HOST_DNS=$(terraform output | grep Public| awk '{print $3}')

echo "
[ec2-java]
$HOST_DNS
" > hosts

ANSIBLE_HOST_KEY_CHECKING=False USER=root PASSWORD=root DATABASE=SpringWebYoutube ansible-playbook -i hosts java_mysql.yml -u ubuntu --private-key ~ubuntu/.ssh/weslley_itau_rsa

echo  "Acessando via SH"
sleep 5
ssh -i ~ubuntu/.ssh/weslley_itau_rsa ubuntu@$HOST_DNS -o ServerAliveInterval=60 -o StrictHostKeyChecking=no
