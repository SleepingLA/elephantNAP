#! /bin/bash

echo Deploiement automatique avec option par defaut
echo Assurez-vous davoir ajuste provision.vars
echo
cat ${NAPDIR}/ansible/vars/provision.vars
echo
echo


export UNATTENDED=1

read

pushd ${NAPDIR}
#################################
echo configuration de base du cluster
${NAPDIR}/bin/provision_and_configure.sh

#################################
echo configuration de hadoop
${NAPDIR}/bin/configure_hadoop.sh


# LOAD HADOOP ENV
source ~/.bash_profile

#################################
echo configuration de hive

${NAPDIR}/bin/configure_hive.sh
${NAPDIR}/bin/hiveinit.sh
${NAPDIR}/bin/start_hive.sh

#################################
echo configuration de zeppelin
${NAPDIR}/bin/configure_zeppelin.sh
${NAPDIR}/bin/start_zeppelin.sh

#################################
echo configuration de nginx
pushd nginx
bash commandes
popd


#################################
echo configuration de cassandra
${NAPDIR}/bin/configure_cassandra.sh
${NAPDIR}/bin/start_cassandra.sh
popd
