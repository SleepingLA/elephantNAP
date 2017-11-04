#! /bin/bash

# platform stop try to stop everything, 
# later you can select to restart different service with start
# and with a modified platform.conf



stop_service(){



#zeppelin
if [ -e /usr/local/zeppelin ] ; then
	#${HOME}/zeppelin/bin/zeppelin-daemon.sh stop
        cd ${NAPDIR}/
        ./bin/stop_zeppelin.sh
fi

# presto
if [ -e /usr/local/presto ] ; then
        cd ${NAPDIR}/
        ./bin/stop_presto.sh
fi


# hive
if [ -e ${HOME}/hive-metastore ] ; then
        ./bin/stop_hive.sh
fi





# HBASE?

if [ -e /usr/local/hbase ] ; then
        echo "repartir Hbase a la main au besoin"
        cd ${NAPDIR}/
        ./bin/stop_hbase.sh
fi


#spark
/usr/local/spark/sbin/stop-all.sh

# hadoop
/usr/local/hadoop/sbin/stop-dfs.sh

# cassandra
temp=$(ls /var/lib/cassandra | wc -l)
if [ $temp -gt 0 ] ; then
        cd ${NAPDIR}/
        ./bin/stop_cassandra.sh
fi


}




# cassandra
# Hue livy
# TODO


###############################################

stop_service



