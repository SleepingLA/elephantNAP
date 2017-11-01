#! /bin/bash
#echo ansible-playbook -i hosts.prod playbook.yml
cd ${CLUOSDIR}/ansible
ANSIBLE_HOST_KEY_CHECKING=False time  ansible-playbook  -f 10 -i hosts.prod install.yml -e 'ansible_python_interpreter=/usr/bin/python3'
#ANSIBLE_HOST_KEY_CHECKING=False time  ansible-playbook  -f 10 -i hosts.prod install.yml # v2

