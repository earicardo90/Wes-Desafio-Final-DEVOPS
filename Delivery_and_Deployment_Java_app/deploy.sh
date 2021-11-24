#!/bin/bash
echo "
[database]
$DEV
$STAGE
$PROD

[kubernets-master]
$K8sMaster
" > Delivery_and_Deployment_Java_app/ansible/hosts
cd Delivery_and_Deployment_Java_app/ansible

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts java_mysql.yml -u ubuntu --private-key /var/lib/jenkins/.ssh/weslley_itau_rsa

echo  "Aguardando o start das aplicações"
sleep 10

echo "Validação da aplicação de DEV"
curl http://$K8sMaster:30000

echo "Validação da aplicação de STAGE"
curl http://$K8sMaster:30001

echo "Validação da aplicação de PROD"
curl http://$K8sMaster:30002
