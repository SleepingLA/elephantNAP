#! /bin/bash
#source ~/utils/source_env.sh

cd ${NAPDIR}/ansible

if [ -e /usr/local//zeppelin ] ; then
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
# demarrage du service a la main
# le faire a partir dansible ne charge pas les varibles denvironnement
echo
#source ~/.bashrc
echo
echo Appel au daemon HOME/zeppelin/bin/zeppelin-daemon.sh start effectue
echo "##########################################"
echo "       nouveau 2017 "
echo "Veuillez lancer la configuration de nginx"
echo "Zeppelin sera uniquement offert depuis   "
echo "un navigateur externe"
echo "##########################################"

