#!/bin/bash -e

# Allow docs to be installed. 
sed -i '/nodocs/d' /etc/yum.conf

yum -y update
