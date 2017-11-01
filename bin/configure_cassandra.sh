#! /bin/bash
#source ~/utils/source_env.sh


cd $HOME/${NAPDIR}/ansible

varfile=vars/cassandra.vars
if [ ! -e $varfile ] ; then
 tempstr=$(cat nodes.prod  | grep hostname | awk ' {print $3}' | tr "\n" ",")
 nodelist=${tempstr::-1}
 echo Creation du fichier $varfile
 echo "#facultatif" > $varfile
 echo "cassandra_seed: " $nodelist >> $varfile
 echo "client_port: 9042"  >> $varfile
fi

if [ -z "$UNATTENDED" ] ; then
 echo editer $varfile au besoin
 echo faire ctrl-c pour configurer les fichiers ou ENTER pour continuer 
 read
fi

echo Appel a ansible-playbook -i hosts.prod configure_cassandra.yml
ansible-playbook -i hosts.prod configure_cassandra.yml
echo
echo
#echo Appel a ansible-playbook -i hosts.prod start_cassandra.yml
#ansible-playbook -i hosts.prod start_cassandra.yml
#echo les serveurs cassandra sont maintenant accessibles
