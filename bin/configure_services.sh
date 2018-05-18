#! /bin/bash


# read conf
file=${NAPDIR}/platform.conf
liste=$(cat $file | grep -v -e '#' | cut -d " " -f1)

for service in $liste
do
 echo
 echo pushing $service config
 echo ${NAPDIR}/bin/configure_${service}.sh
 ${NAPDIR}/bin/configure_${service}.sh
 # LOAD HADOOP ENV
 source ~/.bash_profile

done


