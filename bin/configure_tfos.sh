#! /bin/bash
#source ~/utils/source_env.sh


cd ${NAPDIR}/ansible

if [ -z "$UNATTENDED" ] ; then
 #echo Faire ctrl-c pour configurer les fichiers ou ENTER pour continuer 
 echo
 #read
fi

echo Appel a ansible-playbook -i hosts.prod configure_tfos.yml
ansible-playbook -i hosts.prod configure_tfos.yml
echo
