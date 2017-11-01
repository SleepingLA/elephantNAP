#! /bin/bash

# init metastore

if [ ! -e $HOME/hive-metastore ] ; then
 mkdir $HOME/hive-metastore
 cd $HOME/hive-metastore
 source $HOME/.bashrc
 /usr/local/hive/bin/schematool -dbType derby  -initSchema

# crer hdfs warehouse

 echo config de hdfs
  hdfs dfs -mkdir -p  /user/hive/warehouse
  hdfs dfs -ls /user/hive
  hdfs dfs -chmod g+w /user/hive/warehouse
  hdfs dfs -ls /user/hive
 # demarrer les services

  $HOME/${NAPDIR}/bin/start_hive.sh
else
 echo impossible dinitialiser veuillez reinitiliser  ou seulement partir le service
 echo hiveclean ou hivestart
fi

