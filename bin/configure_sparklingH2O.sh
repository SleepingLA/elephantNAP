#! /bin/bash
#source ~/utils/source_env.sh

cd ${NAPDIR}/ansible

if [ -e /usr/local/sparklingH2O ] ; then
 	echo
	echo "le repertoire sparklingH2O existe : faire le menage"
	echo
	read
	exit 1
fi
echo Appel a ansible-playbook -i hosts.prod configure_sparklingH2O.yml
ansible-playbook -i hosts.prod configure_sparklingH2O.yml
echo
