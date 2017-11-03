#! /bin/bash

echo DELETING BIN DIRECTORY? PRESS ENTER TO CONTINUE
read

rm -fr $HOME/hadoop-data
rm -fr $HOME/hive-metastore 
rm -fr $HOME/zeppelin

sudo rm -fr /usr/local/hive
sudo rm -fr /usr/local/hadoop
sudo rm -fr /usr/local/spark
sudo rm -fr /usr/local/presto
sudo rm -fr /usr/local/hbase
# cassandra ?
# rm -fr
