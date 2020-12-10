#!/bin/bash

# update image
sudo apt-get update

# Install docker
sudo apt-get install \
     apt-transport-https -y \
     ca-certificates -y \
     curl -y \
     gnupg-agent -y \
     software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Run phpmyadmin
sudo docker run --name phpmyadmin -d -e PMA_ARBITRARY=1 -p 80:80 phpmyadmin/phpmyadmin