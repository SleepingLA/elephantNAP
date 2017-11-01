#! /bin/bash
source ~/utils/source_env.sh


cd $HOME/${NAPDIR}/ansible

if [ -e /usr/local/hbase ] ; then
        echo
        echo "le repertoire /usr/local/hbase existe deja : faire le menage"
        echo "veuillez jouer avec la config et repartir les services manuellement"
        echo
        read
        exit 1
fi

varfile=vars/hbase.vars
if [ ! -e $varfile ] ; then
 echo Creation du fichier hbase.vars
 echo "#facultatif" > $varfile
 echo "hbase_zookeeper_quorum: " $HOSTNAME >> $varfile
fi
if [ -z "$UNATTENDED" ] ; then
echo editer hbase.vars au besoin
echo combien de quorumserver
echo remplacer le template dans ANSIBLE par roles/hbase/templates/hbase-site.xml_quorum
echo faire ctrl-c pour configurer les fichiers ou ENTER pour continuer
read
fi

echo Appel a ansible-playbook -i hosts.prod configure_yml/hbase.yml
ansible-playbook -i hosts.prod configure_hbase.yml
echo
#echo
#ansible-playbook -i hosts.prod start_hbase.yml
#echo Hbase est maintenant accessible

