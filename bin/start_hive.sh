#! /bin/bash

if [ -e $HOME/hive-metastore ] ; then


cd $HOME/hive-metastore

# demarrer metastore
/usr/local/hive/bin/hiveserver2 --service metastore > hiveserver2.std 2> hiveserver2.err &


# delai

sleep 5
# demarrer thrift

#/usr/local/spark/sbin/start-thriftserver.sh --hiveconf hive.server2.thrift.port=10001 --hiveconf hive.metastore.uris=thrift://localhost:9083 --hiveconf hive.server2.enable.doAs=false --master spark://${HOSTNAME}:7077  --num-executors 1 --executor-cores 1 --driver-memory 2g --executor-memory 2g

#6 mars
nslave=$(cat /usr/local/spark/conf/slaves | wc -l)
/usr/local/spark/sbin/start-thriftserver.sh --hiveconf hive.server2.thrift.port=10001 --hiveconf hive.metastore.uris=thrift://localhost:9083 --hiveconf hive.server2.enable.doAs=false --master spark://${HOSTNAME}:7077  --total-executor-cores ${nslave} --driver-memory 1g --executor-memory 1g

# exemple

echo pour se connecter directement au server Apache Thrift
echo $SPARK_HOME/bin/beeline -u jdbc:hive2://validhive:10001

else
	echo Erreur veuiilez initialiser le metastore
fi
