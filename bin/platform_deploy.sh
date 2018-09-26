#! /bin/bash

# cluster unique (ou presque)
random=$(( $RANDOM % 100 ))
grep -q  "cluster_id:" ${NAPDIR}/ansible/vars/provision.vars || echo "cluster_id: "$random >> ${NAPDIR}/ansible/vars/provision.vars


echo
echo
echo "Review of Openstack provisioning parameters: (provision.vars)"
echo
cat ${NAPDIR}/ansible/vars/provision.vars
echo
echo
echo "Review of selected services/tools (platform.conf)"
echo
cat platform.conf | grep -v "#"
echo

export UNATTENDED=1

echo Press any key to continue...

read



pushd ${NAPDIR}
#################################
echo configuration de base du cluster
${NAPDIR}/bin/provision_and_configure.sh

# individual service platform.conf
${NAPDIR}/bin/configure_services.sh

# start 
${NAPDIR}/bin/platform_start.sh
