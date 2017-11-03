#! /bin/bash
source ${NAPDIR}/bin/source_env.sh
cd ${NAPDIR}/ansible
echo Appel a ansible-playbook -i hosts.prod start_hbase.yml
ansible-playbook -i hosts.prod start_hbase.yml
echo
echo
echo Hbase est maintenant accessible

