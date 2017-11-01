#! /bin/bash
# ADD to your .bashrc
# source ~/CLuOS/bin/source_env.sh

# modify path if needed
CLUOSDIR=$HOME/CLuOS/
export CLUOSDIR

BINDIR=${CLUOSDIR}/bin
export BINDIR
export PATH=$PATH:${BINDIR}


if [ ! -e ${HOME}/.keystone.cred ] ; then

	FILE=${HOME}/.keystone.cred
	source ${BINDIR}/openstack-openrc.sh
echo	export OS_AUTH_URL=$OS_AUTH_URL >>  $FILE
echo	export OS_PROJECT_NAME=$OS_PROJECT_NAME >>  $FILE
echo	export OS_USERNAME=$OS_USERNAME >>  $FILE
echo	export OS_PASSWORD=$OS_PASSWORD >>  $FILE
echo	export OS_REGION_NAME=$OS_REGION_NAME >>  $FILE


else
	source ${HOME}/.keystone.cred
fi

