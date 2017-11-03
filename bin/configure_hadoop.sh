#! /bin/bash
source ~/utils/source_env.sh


cd ${NAPDIR}/ansible

if [ -e /usr/local/hadoop ] ; then
        echo
        echo "/usr/local/hbase alrady exist"
        echo "cleaning required"
        echo
        read
        exit 1
fi

echo ansible-playbook -i hosts.prod configure_hadoop.yml
ansible-playbook -i hosts.prod configure_hadoop.yml
echo

