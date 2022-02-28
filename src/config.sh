#!/bin/bash

# Update with optional user data that will run on instance start.
# Learn more about user-data: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html
yum update -y
sudo su

echo "install rocketpool here!"

cd /usr/bin
wget https://github.com/rocket-pool/smartnode-install/releases/latest/download/rocketpool-cli-linux-arm64 -O rocketpool
chmod +x rocketpool
./rocketpool --version

yum -y search docker
yum -y install docker
wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)
mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
chmod -v +x /usr/local/bin/docker-compose
systemctl enable docker.service
systemctl start docker.service
usermod -aG docker ec2-user

su ec2-user
cd /home/ec2-user
wget https://github.com/rocket-pool/smartnode-install/releases/latest/download/install.sh -O install.sh
chmod +x install.sh

# ./install.sh -d
# exit

# rm install.sh
# wget <TBD>
# sudo su ec2-user
# rocketpool service install -y -d -n prater
# rocketpool service config