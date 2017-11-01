#! /bin/bash
#source ~/utils/source_env.sh

cd $HOME/${NAPDIR}/ansible

echo Appel a ansible-playbook -i hosts.prod stop_zeppelin.yml
ansible-playbook -i hosts.prod stop_zeppelin.yml
echo
echo
echo le service zeppelin a ete arrete
