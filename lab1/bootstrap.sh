#!/bin/bash 
set -v

# install aws cli and check version
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version


# install salt 
curl -o bootstrap.sh -L https://bootstrap.saltproject.io

# ls files in directory
ls

# chewck to make sure script was downloaded
if [ -f bootstrap.sh ]; then
    # Perms to exec downloaded script
    chmod +x bootstrap.sh

    # install salt minion if minion node
    #TODO: determine if to install master or minion on bootstrap script

    #aws ec2 describe-tags --filters "Name="name,Values=*_master"

    # -M master and minion mode configuraiton setup 
    # stable arg means get specific release version
    sudo ./bootstrap-salt.sh -M stable 3006

    # ensure salt is installed 
    salt --version
else 
    echo "Salt was not able to downloaded"
    exit 1
fi 
