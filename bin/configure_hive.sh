#! /bin/bash
source ${NAPDIR}/bin/source_env.sh

cd ${NAPDIR}/ansible

if [ -e /usr/local/hive ] ; then
 	echo
	echo "le repertoire /usr/local/hive existe deja : faire le menage (hivedelete.sh)"
	echo "veuillez jouer avec la config et repartir les services manuellement"
	echo
	read
	exit 1
fi
varfile=vars/hive.vars
if [ ! -e $varfile ] ; then
 echo Creation du fichier hive.vars
 echo "#facultatif" > $varfile
 echo "hbase_zookeeper_quorum: " $HOSTNAME >> $varfile
fi
if [ -z "$UNATTENDED" ] ; then
 echo editer hive.vars au besoin
 echo faire ctrl-c pour configurer les fichiers ou ENTER pour continuer 
 read
fi

echo Appel a ansible-playbook -i hosts.prod configure_hive.yml
ansible-playbook -i hosts.prod configure_hive.yml

# 
${NAPDIR}/bin/hiveinit.sh



