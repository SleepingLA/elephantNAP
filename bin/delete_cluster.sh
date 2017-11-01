#! /bin/bash

#source $BINDIR/source_env.sh

cd $CLUOSDIR/ansible

ansible-playbook delete.yml -i hosts.prod

echo WARNING PRESS ANYKEY TO DELETE PRIVATE KEY 
read

rm -f newkey.priv
rm -f newkey.pub
rm -f roles/ssh/templates/cluster_rsa
rm -f roles/ssh/templates/cluster_rsa.pub
