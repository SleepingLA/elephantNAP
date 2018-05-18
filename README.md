# elephantNAP
Hadoop Nodes Automated Provisioning

Configure Head node to provision slave nodes with Hadoop-Spark tools 

Steps:
  - Clone elephanNAP
  - Install requirements step1_install_requirements.sh
  - Download and place tar and zip in ansble roles dir step2_download_tar.sh
  - Add eNAP path to .bashrc (source ~/elephantNAP/bin/source_env.sh)
  - Modify provision.var
  - Select apps in platform.conf
  - launch platform_deploy.sh



Accelerated deploy:
  - prepare a cloud image with pre-installed package
    a slave node image after step 1
    a master node image after step 2
