#! /bin/bash
#source ~/utils/source_env.sh

cd $HOME/${NAPDIR}/ansible

echo Appel a ansible-playbook -i hosts.prod start_presto.yml
ansible-playbook -i hosts.prod start_presto.yml
echo
echo
echo le service presto est maintenant accessible