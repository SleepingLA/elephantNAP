#! /bin/bash 

# arret thrift
$SPARK_HOME/sbin/stop-thriftserver.sh
# arret metastore
PID=$(ps aux | grep  Hive | grep -v grep | awk '{print $2 }')

echo PID de Hive metasore $PID
kill -9  $PID
