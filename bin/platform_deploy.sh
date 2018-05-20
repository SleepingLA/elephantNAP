#! /bin/bash

echo Deploiement automatique avec option platform.conf
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

# individual service platform.conf
${NAPDIR}/bin/configure_services.sh

# start 
${NAPDIR}/bin/platform_start.sh
