#! /bin/bash

#source $BINDIR/source_env.sh

cd $NAPDIR/ansible

echo "WARNING DELETING SLAVE NODES PRESS ENTER TO CONTINUE (CTRL-C TO CANCEL)"
read
ansible-playbook delete.yml -i hosts.prod

echo "PRESS ENTER TO DELETE SSH PRIVATE KEY (CTRL-C OT CANCEL)"
read

ansible-playbook delete.yml -i hosts.prod

rm -f newkey.priv
rm -f newkey.pub
rm -f roles/ssh/templates/cluster_rsa
rm -f roles/ssh/templates/cluster_rsa.pub
