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
echo configuration du cluster
./bin/provision_and_configure.sh

source ~/.bash_profile

#################################
echo configuration de hive

./bin/configure_hive.sh
./bin/hiveinit.sh
./bin/start_hive.sh

#################################
echo configuration de zeppelin
./bin/configure_zeppelin.sh
./bin/start_zeppelin.sh

#################################
echo configuration de nginx
pushd nginx
bash commandes
popd


#################################
echo configuration de cassandra
./bin/configure_cassandra.sh
./bin/start_cassandra.sh
popd
