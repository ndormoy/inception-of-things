#!/bin/bash

sudo k3d cluster delete my-k3d-cluster
sudo rm $(which k3d)
sudo rm -rf ~/.kube
sudo rm $(which kubectl)

sudo docker ps -aq | xargs docker stop | xargs docker rm
sudo docker container prume -f
sudo docker image prune -f
sudo docker volume prune -f
sudo docker network prune -f
sudo docker system prune -a -f

sudo apt-get purge docker-ce docker-ce-cli containerd.io -y
sudo rm -rf /var/lib/docker

# destroy kubectl
