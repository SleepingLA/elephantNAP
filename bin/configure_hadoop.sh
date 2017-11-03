#! /bin/bash
source ${NAPDIR}/bin/source_env.sh


cd ${NAPDIR}/ansible

if [ -e /usr/local/hadoop ] ; then
        echo
        echo "/usr/local/hadoop already exist"
        echo "HDFS formatting will be done"
        echo
        read
        #exit 1
fi

echo ansible-playbook -i hosts.prod configure_hadoop.yml
ansible-playbook -i hosts.prod configure_hadoop.yml
echo

