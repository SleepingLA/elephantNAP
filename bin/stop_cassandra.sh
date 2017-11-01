#! /bin/bash
#source ~/utils/source_env.sh

cd $HOME/${NAPDIR}/ansible

echo Appel a ansible-playbook -i hosts.prod stop_cassandra.yml
ansible-playbook -i hosts.prod stop_cassandra.yml
echo
echo
echo les serveurs cassandra sont maintenant accessibles
