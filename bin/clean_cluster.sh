#! /bin/bash

echo DELETING BIN DIRECTORY? PRESS ENTER TO CONTINUE
read

cd ${NAPDIR}/ansible
echo ansible-playbook -i hosts.prod clean_cluster.yml
ansible-playbook -i hosts.prod clean_cluster.yml
echo


rm -fr $HOME/hadoop-data
rm -fr $HOME/hive-metastore 

sudo rm -fr /usr/local/hive
sudo rm -fr /usr/local/hadoop
sudo rm -fr /usr/local/spark
sudo rm -fr /usr/local/presto
sudo rm -fr /usr/local/hbase
sudo rm -fr /usr/local/zeppelin
# cassandra ?
# rm -fr
