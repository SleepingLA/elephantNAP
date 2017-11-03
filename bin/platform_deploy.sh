#! /bin/bash

read_conf(){


}

echo Deploiement automatique avec option platform.conf
echo Assurez-vous davoir ajuste provision.vars
echo
cat ${NAPDIR}/ansible/vars/provision.vars
echo
echo


export UNATTENDED=1

read

#
# read conf
file=${NAPDIR}/platform.conf
liste=$(cat $file | grep -v -e '#')

pushd ${NAPDIR}
#################################
echo configuration de base du cluster
${NAPDIR}/bin/provision_and_configure.sh


for service in $liste
do
 echo
 echo pushing $service config
 echo ${NAPDIR}/bin/configure_${service}.sh
 ${NAPDIR}/bin/configure_${service}.sh
 # LOAD HADOOP ENV 
 source ~/.bash_profile

done

exit

#################################
# EXTRA
#################################
echo configuration de nginx
pushd nginx
bash commandes
popd
