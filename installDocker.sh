#!/bin/bash
#this user will not need sudo to run docker
usr=$1

#adding repository
tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

# install docker from the added repository
yum install -y docker-engine

#start docker service
service docker start

#add group docker
groupadd docker

#adds docker permissions to user defined on the commandline
usermod -aG docker $usr

#get docker-compose
curl -L https://github.com/docker/compose/releases/download/1.8.0-rc1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

#make docker-compose executable
chmod +x /usr/local/bin/docker-compose

#get example wiki's docker-compose.yml
curl -L -O https://raw.githubusercontent.com/amazingfly/configs/master/docker-compose.yml

#run docker compose
docker-compose up
