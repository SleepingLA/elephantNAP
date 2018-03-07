
#arret des services
#${NAPDIR}/bin/stop_hive.sh
${NAPDIR}/bin/platform_service.sh stop hive

# effacer hdfs warehouse

hdfs dfs -rm -r /user/hive/warehouse
# clean tmp
hdfs dfs -rm -r /tmp/hive/*

# effacer metastore
rm -fr  $HOME/hive-metastore
