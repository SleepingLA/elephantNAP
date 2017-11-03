#! /bin/bash

#HDFS
if [ -e /usr/local/hadoop/sbin/start-dfs.sh ] ; then
	/usr/local/hadoop/sbin/start-dfs.sh
else
	echo  Error no /usr/local/hadoop/sbin/start-dfs.sh
	exit 1
fi

#SPARK
if [ -e /usr/local/spark/sbin/start-all.sh ] ; then
	/usr/local/spark/sbin/start-all.sh
else
	echo  Error no /usr/local/spark/sbin/start-all.sh
	exit 1
fi
