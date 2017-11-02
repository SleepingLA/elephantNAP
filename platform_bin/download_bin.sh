#~ /bin/bash


chmod u+w .

# download

#if true; then
if false; then

 wget http://apache.mirror.vexxhost.com/hadoop/common/hadoop-2.7.4/hadoop-2.7.4.tar.gz
 wget http://apache.mirror.vexxhost.com/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz
 wget http://apache.mirror.vexxhost.com/hive/hive-2.3.0/apache-hive-2.3.0-bin.tar.gz
 wget http://apache.mirror.vexxhost.com/hbase/1.2.6/hbase-1.2.6-bin.tar.gz
 wget http://apache.mirror.vexxhost.com/zeppelin/zeppelin-0.7.3/zeppelin-0.7.3-bin-all.tgz


 wget https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.187/presto-server-0.187.tar.gz
 wget https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/0.187/presto-cli-0.187-executable.jar
fi


#place in ansible tree

mkdir ${NAPDIR}/ansible/roles/hadoop/files
mv hadoop-2.7.4.tar.gz ${NAPDIR}/ansible/roles/hadoop/files
mv spark-2.2.0-bin-hadoop2.7.tgz ${NAPDIR}/ansible/roles/hadoop/files
mv hbase-1.2.6-bin.tar.gz ${NAPDIR}/ansible/roles/hbase/templates/
mv apache-hive-2.3.0-bin.tar.gz ${NAPDIR}/ansible/roles/hive/templates/
mkdir ${NAPDIR}/ansible/roles/zeppelin/files
mv zeppelin-0.7.3-bin-all.tgz ${NAPDIR}/ansible/roles/zeppelin/files
mkdir ${NAPDIR}/ansible/roles/presto/files
mv presto-server-0.185.tar.gz ${NAPDIR}/ansible/roles/presto/files
mv presto-cli-0.185-executable.jar ${NAPDIR}/ansible/roles/presto/files

