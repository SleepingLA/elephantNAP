#! /bin/bash
cd ${NAPDIR}/ansible
echo Appel a ansible-playbook -i hosts.prod stop_hbase.yml
ansible-playbook -i hosts.prod stop_hbase.yml
echo
echo
echo Le service Hbase est maintenant arrete

