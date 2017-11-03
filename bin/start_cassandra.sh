#! /bin/bash
#source ~/utils/source_env.sh

cd ${NAPDIR}/ansible

echo Appel a ansible-playbook -i hosts.prod start_cassandra.yml
ansible-playbook -i hosts.prod start_cassandra.yml
echo
echo
echo les serveurs cassandra sont maintenant accessibles
