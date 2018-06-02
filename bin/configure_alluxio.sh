#! /bin/bash
source $NAPDIR/bin/source_env.sh


cd ${NAPDIR}/ansible

if [ -e /usr/local/alluxio ] ; then
        echo
        echo "le repertoire /usr/local/alluxio existe deja : faire le menage"
        echo "veuillez jouer avec la config et repartir les services manuellement"
        echo
        read
        exit 1
fi

varfile=vars/alluxio.vars
if [ ! -e $varfile ] ; then
 #echo Creation du fichier hbase.vars
 #echo "#facultatif" > $varfile
 #echo "hbase_zookeeper_quorum: " $HOSTNAME >> $varfile
fi
if [ -z "$UNATTENDED" ] ; then
echo editer alluxio.vars au besoin
echo faire ctrl-c pour configurer les fichiers ou ENTER pour continuer
read
fi

echo Appel a ansible-playbook -i hosts.prod configure_yml/hbase.yml
ansible-playbook -i hosts.prod configure_alluxio.yml
echo
#echo
#ansible-playbook -i hosts.prod start_hbase.yml
#echo Hbase est maintenant accessible

