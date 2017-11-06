#! /bin/bash

# https://codereview.stackexchange.com/questions/55077/small-bash-script-to-start-and-stop-named-services

startstop_service() {
    cmd=$1
    name=$2
    cd ${NAPDIR}/ansible
    echo Appel a ansible-playbook -i hosts.prod start_cassandra.yml
    ansible-playbook -i hosts.prod start_$name.yml --extra-vars "action=$cmd"
}

startstop_hadoop() {
    cmd=$1
    #HDFS
    if [ -e /usr/local/hadoop/sbin/${cmd}-dfs.sh ] ; then
        /usr/local/hadoop/sbin/${cmd}-dfs.sh
    else
        echo  Error no /usr/local/hadoop/sbin/${cmd}-dfs.sh
        exit 1
    fi

    #SPARK
    if [ -e /usr/local/spark/sbin/${cmd}-all.sh ] ; then
        /usr/local/spark/sbin/${cmd}-all.sh
    else
        echo  Error no /usr/local/spark/sbin/${cmd}-all.sh
        exit 1
    fi

}

startstop_hive() {
    cmd=$1
    case $cmd in
        stop)
         # arret thrift
         $SPARK_HOME/sbin/stop-thriftserver.sh
         # arret metastore
         PID=$(ps aux | grep  Hive | grep -v grep | awk '{print $2 }')
         if [ "${PID}_null" != "_null" ] ; then
          echo PID de Hive metasore $PID
          kill -9  $PID
         fi


        ;;
        start)
          if [ -e $HOME/hive-metastore ] ; then

            cd $HOME/hive-metastore
            # demarrer metastore
            echo starting Hive metastore
            /usr/local/hive/bin/hiveserver2 --service metastore > hiveserver2.std 2> hiveserver2.err &


            # delai
            sleep 5
            # demarrer thrift
            nslave=$(cat /usr/local/spark/conf/slaves | wc -l)
            echo starting thriftserver on ${HOSTNAME}
            /usr/local/spark/sbin/start-thriftserver.sh \
                --hiveconf hive.server2.thrift.port=10001 --hiveconf hive.metastore.uris=thrift://localhost:9083 --hiveconf hive.server2.enable.doAs=false  \
                --master spark://${HOSTNAME}:7077  --total-executor-cores ${nslave} --driver-memory 1g --executor-memory 1g

           # exemple

           #echo pour se connecter directement au server Apache Thrift
           #echo $SPARK_HOME/bin/beeline -u jdbc:hive2://$HOSTNAME:10001

          else
          echo Error No hive metastore
          fi

        ;;
    esac
}



liste_service=$(cat $NAPDIR/platform.conf  | grep -v -e "#" | tr "\n" "|")

if [ $# -lt 2 ] ; then
        echo "usage: $0 [start|stop|restart] [$liste]"
        exit 1
fi

case "$1" in
    start|stop|restart) cmd=$1 ;;
    *)
        shift
        servicenames=${@-servicenames}
        echo "usage: $0 [start|stop|restart] $servicenames"
        exit 1
esac
shift

#TODO VERIF services

# warning order is important ( hdfs for hive)
for name; do
    case "$name" in
        hadoop) startstop_hadoop $cmd ;;
        hive) startstop_hive $cmd ;;
        *) startstop_service $cmd $name ;;
    esac
done

