#!/bin/bash

DISTRIBUTION=${1:-ubuntu}

install_python_libraries(){
    echo "Installin python libraries"

    # ML and data analysis libraries
    pip install pandas --user
    pip install sklearn -- user
    pip install airflow --user
    pip install matplotlib --user
    pip install tensorflow --user
    pip install jupyter --user

    # GCP libraries
    
    pip install --user pandas_gbq
    pip install --user google-cloud-bigquery

    # AWS
    pip install boto3

}

echo "Data Science setup. The following tools will be installed:"
echo -e "\n1. Python V. 3.8.5 "
echo -e "\n2. Git Latest version"
echo -e "\n3. Docker Latest version"


if [ $DISTRIBUTION = "ubuntu" ]; then
#    sudo apt update
#    sudo apt upgrade
    echo "running ubuntu configuraiton.."

    # Python setup
    install_python_libraries
else
#    sudo yumn update -y
    echo " running centos configurations"
    sudo yum -y update
    sudo yum in

    # git
    sudo yum install git
    
    # Python setup
    sudo yum install -y  python38
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    sudo python3 get-pip.py

    install_python_libraries
    
fi

: '
# This bash script install python 3.7, jupyter notebook, airflow, docker and git 
# Python - jupyter - standard modules
sudo yum install  -y python37
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
pip install --user jupyter


# Docker
sudo yum install -y python3-pip python3 python3-setuptools
sudo yum update -y
sudo amazon-linux-extras install docker

# Git
sudo yum install git

# GCP python modules
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-255.0.0-linux-x86_64.tar.gz
tar zxvf google-cloud-sdk-255.0.0-linux-x86_64.tar.gz
./google-cloud-sdk/install.s

# Airflow
export  AIRFLOW_HOME=~/airflow
pip install apache-airflow
'
