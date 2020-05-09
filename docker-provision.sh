#!/bin/bash

# https://docs.docker.com/engine/install/centos/

# VERSION CONFIGURATION
DOCKER_VERSION=19.03.8-3.el7
COMPOSE_VERSION=1.25.5

# SET UP THE REPOSITORY
sudo yum update -y
sudo yum install -y yum-utils curl
sudo yum-config-manager \
  --add-repo \
  https://download.docker.com/linux/centos/docker-ce.repo

# Optional: Enable the nightly or test repositories.
# sudo yum-config-manager --enable docker-ce-nightly
# sudo yum-config-manager --enable docker-ce-test

# install
sudo yum install -y docker-ce-${DOCKER_VERSION} docker-ce-cli-${DOCKER_VERSION} containerd.io

# Start and Enable docker.
sudo systemctl start docker
sudo systemctl enable docker

# add permission docker command
sudo usermod -aG docker vagrant

# add docker-compose 
sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# add permission
sudo chmod +x /usr/local/bin/docker-compose
# bash completion
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# show versions
docker version
docker-compose version
