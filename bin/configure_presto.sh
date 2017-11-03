#! /bin/bash
#source ~/utils/source_env.sh


cd ${NAPDIR}/ansible

if [ -z "$UNATTENDED" ] ; then
 echo Editer le configure_presto playbook au besoin
 echo Faire ctrl-c pour configurer les fichiers ou ENTER pour continuer 
 read
fi

echo Appel a ansible-playbook -i hosts.prod configure_presto.yml
ansible-playbook -i hosts.prod configure_presto.yml
echo
