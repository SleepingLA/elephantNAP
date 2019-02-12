#~ /bin/bash

# DEFINE MANUALLY  NAPDIR
# DEFAULT
export NAPDIR=/home/ubuntu/elephantNAP

chmod u+w .

# download

#if true; then
if false; then

 wget http://apache.mirror.vexxhost.com/hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz
 wget http://apache.mirror.vexxhost.com/spark/spark-2.4.0/spark-2.4.0-bin-hadoop2.7.tgz

 wget http://apache.mirror.vexxhost.com/hive/hive-2.3.4/apache-hive-2.3.4-bin.tar.gz
 wget http://apache.mirror.vexxhost.com/hbase/2.0.0/hbase-2.0.0-bin.tar.gz
 wget http://apache.mirror.vexxhost.com/zeppelin/zeppelin-0.8.0/zeppelin-0.8.0-bin-all.tgz

 wget http://apache.mirror.vexxhost.com/ignite/2.3.0/apache-ignite-fabric-2.3.0-bin.zip

 wget --no-check-certificate https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.213/presto-server-0.213.tar.gz
 wget --no-check-certificate  https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/0.213/presto-cli-0.213-executable.jar


 wget --no-check-certificate https://s3.amazonaws.com/h2o-release/sparkling-water/rel-2.4/5/sparkling-water-2.4.5.zip
 exit
fi


#place in ansible role tree
#must create dir: git dont arch empty files dir

mkdir ${NAPDIR}/ansible/roles/hadoop/files
mv hadoop-2.8.5.tar.gz ${NAPDIR}/ansible/roles/hadoop/files
mv spark-2.4.0-bin-hadoop2.7.tgz ${NAPDIR}/ansible/roles/hadoop/files

mv hbase-2.0.0-bin.tar.gz ${NAPDIR}/ansible/roles/hbase/templates/
mv apache-hive-2.3.4-bin.tar.gz ${NAPDIR}/ansible/roles/hive/templates/

mkdir ${NAPDIR}/ansible/roles/zeppelin/files
#mv zeppelin-0.8.0-bin-all.tgz ${NAPDIR}/ansible/roles/zeppelin/files
mv zeppelin-0.8.1-bin-netinst.tgz ${NAPDIR}/ansible/roles/zeppelin/files

mkdir ${NAPDIR}/ansible/roles/presto/files
mv presto-server-0.213.tar.gz ${NAPDIR}/ansible/roles/presto/files
mv presto-cli-0.213-executable.jar ${NAPDIR}/ansible/roles/presto/files

mkdir ${NAPDIR}/ansible/roles/ignite/files
mv apache-ignite-fabric-2.3.0-bin.zip ${NAPDIR}/ansible/roles/ignite/files

mkdir ${NAPDIR}/ansible/roles/sparkling/files
mv sparkling-water-2.4.5.zip ${NAPDIR}/ansible/roles/sparklingH2O/files


# download manually
mkdir -p ${NAPDIR}/ansible/roles/alluxio/files
mv alluxio-1.7.1-hadoop-2.7-bin.tar.gz ${NAPDIR}/ansible/roles/alluxio/files
