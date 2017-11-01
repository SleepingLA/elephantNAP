#! /bin/bash
#source ~/utils/source_env.sh
cd $HOME/${NAPDIR}/ansible


echo Appel a ansible-playbook -i hosts.prod start_zeppelin.yml
ansible-playbook -i hosts.prod start_zeppelin.yml
echo
echo
echo le service zeppelin est accessible
