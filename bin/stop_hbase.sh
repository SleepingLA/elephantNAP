#! /bin/bash
source ~/utils/source_env.sh
cd $HOME/${NAPDIR}/ansible
echo Appel a ansible-playbook -i hosts.prod stop_hbase.yml
ansible-playbook -i hosts.prod stop_hbase.yml
echo
echo
echo Le service Hbase est maintenant arrete

