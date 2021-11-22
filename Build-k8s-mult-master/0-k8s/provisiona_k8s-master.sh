#!/bin/bash

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts 2-provisionar-k8s-master-auto-shell.yml -u ubuntu --private-key /var/lib/jenkins/.ssh/weslley_itau_rsa