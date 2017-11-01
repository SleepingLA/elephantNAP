#! /bin/bash

#source ~/utils/source_env.sh
cd $CLUOSDIR/ansible

#config initile de ssh config
#echo   "Host * ">~/.ssh/config
#echo   StrictHostKeyChecking no >>~/.ssh/config
#echo   UserKnownHostsFile=/dev/null >>~/.ssh/config
#chmod 600 ~/.ssh/config


uname -a  | grep -i ubuntu > /dev/null
if [ $? -eq 0 ] ; then
 linux=ubuntu
else
 linux=centos
fi

#CREDS OPENSTACK FOR SWIFT ACCESS
VARFILE=roles/vars/openstack
echo cluster_user: ${linux}  > $VARFILE
echo cluster_group: ${linux} >> $VARFILE
echo keystone_auth: $OS_AUTH_URL >> $VARFILE
echo project_tenant: $OS_PROJECT_NAME  >> $VARFILE
echo user_tenant: $OS_USERNAME  >> $VARFILE
echo user_password: $OS_PASSWORD  >> $VARFILE


# 
# provision with ansible, hostfile generation
# 

# key.priv onetimer creation
if [ ! -e roles/ssh/templates/cluster_rsa ] ; then
 ansible-playbook os-keygen.yml
 mkdir -p roles/ssh/templates/
 cp newkey.priv roles/ssh/templates/cluster_rsa
 cp newkey.pub roles/ssh/templates/cluster_rsa.pub
fi 
#provision
ansible-playbook provision.yml
#openstack keypair show $namekey  --public-key  >> ~/.ssh/authorized_keys

${BINDIR}/configure_cluster.sh
#echo ansible-playbook -i hosts.prod playbook.yml
#time ansible-playbook  -f 10 -i hosts.prod playbook.yml

