#! /bin/bash
# Prepare an image with preinstalled packages:
# Ansible will deploy Hadoop stack at the provisoning


# STD NODE IMAGE

#if true; then
#if false; then

  sudo apt-get update;
  sudo apt-get upgrade --yes;
  echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list;
  curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -;
  sudo apt-get update;
  sudo apt-get install openjdk-8-jdk --yes;
  sudo apt-get clean;
  sudo apt-get install  cassandra ntp --yes;
  #sudo service cassandra status;
  sudo service cassandra stop;
  sudo systemctl disable cassandra;
  sudo apt-get clean;

  sudo apt-get install libffi-dev libssl-dev libyaml-dev unzip --yes;
  sudo apt-get install python python-dev python-pip --yes;
  sudo apt-get clean;

  sudo -H pip install --upgrade pip --yes;
  sudo -H pip install --no-cache-dir  pandas
  sudo -H pip install --no-cache-dir  sklearn-pandas
  sudo -H pip install --no-cache-dir  matplotlib

  sudo -H pip install --no-cache-dir  python-openstackclient
  sudo -H pip install --no-cache-dir  python-swiftclient


#  sudo poweroff;
#fi

#MASTER IMAGE = STDNODE IMAGE +

 sudo apt-get install apache2-utils nginx --yes;
 sudo apt-get clean;

 sudo systemctl  stop nginx;
 sudo systemctl  disable nginx;

 sudo -H pip install --no-cache-dir ansible;
 sudo -H pip install --no-cache-dir shade;
 sudo -H pip install --no-cache-dir cassandra-driver;


 # reupdate crypto and friends
 #sudo pip uninstall pyOpenSSL;
 #sudo pip install pyOpenSSL;
