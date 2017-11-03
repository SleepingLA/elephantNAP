#! /bin/bash
#source ~/utils/source_env.sh

cd ${NAPDIR}/ansible

if [ -e /usr/local/zeppelin ] ; then
 	echo
	echo "le repertoire zeppelin existe : faire le menage"
	echo "et arreter le daemon"
	echo
	read
	exit 1
fi
echo Appel a ansible-playbook -i hosts.prod configure_zeppelin.yml
ansible-playbook -i hosts.prod configure_zeppelin.yml
echo
