#! /bin/bash

echo DELETING BIN DIRECTORY? PRESS ENTER TO CONTINUE
read

rm -fr $HOME/hadoop-data
rm -fr $HOME/hive-metastore 
rm -fr $HOME/zeppelin

rm -fr /usr/local/hive
rm -fr /usr/local/hadoop
rm -fr /usr/local/spark
rm -fr /usr/local/presto
rm -fr /usr/local/hbase
# cassandra ?
# rm -fr
