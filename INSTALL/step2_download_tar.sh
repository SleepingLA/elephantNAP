#~ /bin/bash


chmod u+w .

# download

#if true; then
if false; then

 wget http://apache.mirror.vexxhost.com/hadoop/common/hadoop-2.7.6/hadoop-2.7.6.tar.gz
 wget http://apache.mirror.vexxhost.com/spark/spark-2.3.0/spark-2.3.0-bin-hadoop2.7.tgz

 wget http://apache.mirror.vexxhost.com/hive/hive-2.3.3/apache-hive-2.3.3-bin.tar.gz
 wget http://apache.mirror.vexxhost.com/hbase/2.0.0/hbase-2.0.0-bin.tar.gz
 wget http://apache.mirror.vexxhost.com/zeppelin/zeppelin-0.7.3/zeppelin-0.7.3-bin-all.tgz

 wget http://apache.mirror.vexxhost.com/ignite/2.3.0/apache-ignite-fabric-2.3.0-bin.zip

 wget --no-check-certificate https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.201/presto-server-0.201.tar.gz
 wget --no-check-certificate  https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/0.201/presto-cli-0.201-executable.jar

 exit
fi


#place in ansible role tree
#must create dir: git dont arch empty files dir

mkdir ${NAPDIR}/ansible/roles/hadoop/files
mv hadoop-2.7.6.tar.gz ${NAPDIR}/ansible/roles/hadoop/files
mv spark-2.3.0-bin-hadoop2.7.tgz ${NAPDIR}/ansible/roles/hadoop/files

mv hbase-2.0.0-bin.tar.gz ${NAPDIR}/ansible/roles/hbase/templates/
mv apache-hive-2.3.3-bin.tar.gz ${NAPDIR}/ansible/roles/hive/templates/

mkdir ${NAPDIR}/ansible/roles/zeppelin/files
mv zeppelin-0.7.3-bin-all.tgz ${NAPDIR}/ansible/roles/zeppelin/files
mkdir ${NAPDIR}/ansible/roles/presto/files
mv presto-server-0.201.tar.gz ${NAPDIR}/ansible/roles/presto/files
mv presto-cli-0.201-executable.jar ${NAPDIR}/ansible/roles/presto/files

mkdir ${NAPDIR}/ansible/roles/ignite/files
mv apache-ignite-fabric-2.3.0-bin.zip ${NAPDIR}/ansible/roles/ignite/files

# download manually
mkdir -p ${NAPDIR}/ansible/roles/alluxio/files
mv alluxio-1.7.1-hadoop-2.7-bin.tar.gz ${NAPDIR}/ansible/roles/alluxio/files
