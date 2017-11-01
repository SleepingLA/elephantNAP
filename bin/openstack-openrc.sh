#!/bin/bash

# To use an OpenStack cloud you need to authenticate against the Identity
# service named keystone, which returns a **Token** and **Service Catalog**.
# The catalog contains the endpoints for all services the user/tenant has
# access to - such as Compute, Image Service, Identity, Object Storage, Block
# Storage, and Networking (code-named nova, glance, keystone, swift,
# cinder, and neutron).
#
# *NOTE*: Using the 2.0 *Identity API* does not necessarily mean any other
# OpenStack API is version 2.0. For example, your cloud provider may implement
# Image API v1.1, Block Storage API v2, and Compute API v2.0. OS_AUTH_URL is
# only for the Identity API served through keystone.
echo
echo "First Login Configuration"
echo
echo "Please enter your OpenStack Authentification Endpoint: "
echo
echo "Example: "
echo "http://10.7.240.6:5000/v2.0"
echo "http://?.?.?.?:5000/v2.0"
echo
read -r OS_INPUT
#export OS_AUTH_URL=http://osk-identity-1-1.hc.hydro.qc.ca:5000/v2.0
export OS_AUTH_URL=$OS_INPUT


# With the addition of Keystone we have standardized on the term **tenant**
# as the entity that owns the resources.
#export OS_TENANT_ID=94dcff6c9ac94ce599e7be18370f6be7
echo "Please enter your OpenStack Project Name: "
read -r OS_INPUT
#export OS_PASSWORD=$OS_PASSWORD_INPUT
export OS_TENANT_NAME=$OS_INPUT
export OS_PROJECT_NAME=$OS_INPUT

# In addition to the owning entity (tenant), OpenStack stores the entity
# performing the action as the **user**.
echo "Please enter your OpenStack User Login: "
read -r OS_INPUT
export OS_USERNAME=$OS_INPUT
#export OS_USERNAME="cs6292"

# With Keystone you pass the keystone password.
echo "Please enter your OpenStack Password: "
read -sr OS_PASSWORD_INPUT
export OS_PASSWORD=$OS_PASSWORD_INPUT

# If your configuration has multiple regions, we set that information here.
# OS_REGION_NAME is optional and only valid in certain environments.
export OS_REGION_NAME="RegionOne"
# Don't leave a blank variable, unset it if it was empty
if [ -z "$OS_REGION_NAME" ]; then unset OS_REGION_NAME; fi
