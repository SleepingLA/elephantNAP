# elephantNAP
Hadoop Nodes Automated Provisioning [for OpenStack]

Configure Head node to provision slave nodes with Hadoop-Spark tools 

Requirements Steps:
  - Clone elephanNAP project
  - Install packages requirements (step1_install_requirements.sh)
  - Add eNAP path to .bashrc [step1.5]  (source ~/elephantNAP/bin/source_env.sh)
  - Download and put tar/zip in Ansible roles dir  (step2_download_tar.sh)

Provisioning Steps:
  - Modify provision.var
  - Select apps in platform.conf
  - launch platform_deploy.sh



Accelerated deploy:
  - prepare cloud images (snapshots) with pre-installed packages
	  - a slave node image after step 1
	  - a master node image after step 3
  - Modify provision.var with IDs of slave snapshots
