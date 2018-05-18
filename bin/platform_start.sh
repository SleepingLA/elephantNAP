#! /bin/bash

source ~/.bash_profile
#
# read conf
# change platform.conf to launch subset of  initially configured services
file=${NAPDIR}/platform.conf
liste=$(cat $file | grep -v -e '#' | cut -d " " -f1)

for service in $liste
do
 echo
 echo Starting $service 
 #echo ${NAPDIR}/bin/start_${service}.sh
 echo ${NAPDIR}/bin/platform_service.sh start ${service}
 ${NAPDIR}/bin/platform_service.sh start ${service}

done

