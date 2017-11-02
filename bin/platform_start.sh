#! bin/bash

# config  des services configures pourrait se trouver dans deploystart...

# Verfication si  bien installe

if [ ! -e /usr/local/hadoop/sbin/start-dfs.sh ] ; then
	echo Veuillez dabord deployer la plateforme avec provision_plateforme
	exit 1
fi

#services de base
# hadoop
/usr/local/hadoop/sbin/start-dfs.sh
#/usr/local/hadoop/sbin/start-all.sh

#spark
/usr/local/spark/sbin/start-all.sh

# hive

if [ -e ${HOME}/hive-metastore ] ; then
	hivestart.sh
fi

#zeppelin
if [ -e /usr/local/zeppelin ] ; then
	#${HOME}/zeppelin/bin/zeppelin-daemon.sh start
	./bin/start_zeppelin.sh
fi

# HBASE?

if [ -e /usr/local/hbase ] ; then
	echo "repartir Hbase a la main au besoin"
	cd ~/${NAPDIR}/
	./bin/start_hbase.sh
fi

# cassandra
if [ -e /var/lib/cassandra ] ; then # toujours present
	cd ~/${NAPDIR}/
	./bin/start_cassandra.sh
fi


# TODO


# Hue livy
# repartir a la main
