#! /bin/bash

# init metastore

if [ ! -e $HOME/hive-metastore ] ; then

 if [ -e /usr/local/hive/bin/schematool ] ; then

 # TODO
 #test working HDFS
 
 mkdir $HOME/hive-metastore
 cd $HOME/hive-metastore
 source $HOME/.bashrc
 /usr/local/hive/bin/schematool -dbType derby  -initSchema

# create hdfs warehouse

 echo config de hdfs
  hdfs dfs -mkdir -p  /user/hive/warehouse
  hdfs dfs -ls /user/hive
  hdfs dfs -chmod g+w /user/hive/warehouse
  hdfs dfs -ls /user/hive

  
  hdfs dfs -mkdir -p  /tmp/hive
  hdfs dfs -chmod 777 /tmp/hive


 # demarrer les services
 # ${NAPDIR}/bin/start_hive.sh
  fi

else
 echo impossible dinitialiser veuillez reinitiliser  ou seulement demarrer le service
 echo hiveclean ou hivestart
fi

