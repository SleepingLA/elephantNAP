
#arret des services
${NAPDIR}/bin/stop_hive.sh

# effacer hdfs warehouse

hdfs dfs -rm -r /user/hive/warehouse
# effacer metastore
rm -fr  $HOME/hive-metastore
