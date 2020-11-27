#!/bin/bash


CURRENT_PATH=$(pwd)
DISTRIBUTION=${1:-ubuntu}
SPARK_CONFIG=${2:-false}

install_python_libraries(){
    echo "Installing python libraries..."

    # Download env_requirements
    if [ ! -f ./env_requirements.txt ]; then
        wget https://raw.githubusercontent.com/abdala9512/data-science-linux-env/main/env_requirements.txt
    fi

    for lib in $(env_requirements.txt);
    do
        pip3 install $lib --user
    done
    
    rm env_requirements.txt
}

message(){

echo "Data Science setup. The following tools will be installed:"
echo -e "\n1. Python V. 3.8.6 "
echo -e "\n2. Git Latest version"
echo -e "\n3. Docker Latest version"

}


if [ $DISTRIBUTION = "ubuntu" ]; then
       
    echo "Running Ubuntu configuration.."
    cd

    message
    sudo apt update
    sudo apt upgrade
    
    #
    cd /usr/lib/python3/dist-packages
    sudo ln -s apt_pkg.cpython-36m-x86_64-linux-gnu.so apt_pkg.so
    cd 

    # Git 
    sudo apt install git

    # Docker installation
    sudo apt install docker.io
 
    # Python setup
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt install python3.8
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 10
    
    echo "alias python='python3'" >> ~/.bashrc
    
    sudo apt install python3-pip
    install_python_libraries
    
    # Heroku CLI
    sudo snap install --classic heroku


    if [ "$SPARK_CONFIG" = true ]; then
        echo "Spark installation...."
        
        sudo add-apt-repository ppa:openjdk-r/ppa
        sudo apt update -y
        sudo apy upgrade -y

        sudo apt -y install openjdk-8-jre
        sudo apt -y install scala
        sudo pip3 install py4j

        wget https://downloads.apache.org/spark/spark-2.4.7/spark-2.4.7-bin-hadoop2.7.tgz
        sudo tar -xvf spark-2.4.7-bin-hadoop2.7.tgz
        sudo pip3 install findspark

        # Spark environment variables


    fi
    
    cd $CURRENT_PATH
    echo -e "\nSetup succesfully finished :)"

elif [ $DISTRIBUTION = 'redhat' ]; then
   
    echo " running centos configuration..."
    cd
    
    message
    sudo yum -y update

    # git
    sudo yum install git
    
    # Python setup
    sudo yum install -y python38
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    sudo python3 get-pip.py

    echo "alias python='python3'" >> ~/.bashrc
    install_python_libraries

    export AIRFLOW_HOME=~/airflow
    pip install apache-airflow

    cd $CURRENT_PATH
    echo -e "\nSetup succesfully finished :)"
else
    echo "Distribution not recognized"
    exit 0
fi

