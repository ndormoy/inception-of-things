#!/bin/bash

# sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Install K3s in agent mode
# The port 6443 is commonly used for the Kubernetes API server
# This command downloads the K3s installation script, sets the K3S_URL and K3S_TOKEN environment variables to connect to the K3s server on ndormoyS using port 6443

MASTER_IP="192.168.42.110"
WORKER_IP="192.168.42.111"
# curl -sfL https://get.k3s.io | K3S_URL="https://ndormoyS:6443" K3S_TOKEN="$(cat /vagrant/server_node_token/node-token)" sh -


# curl -sfL https://get.k3s.io | K3S_URL="https://${MASTER_IP}:6443" K3S_TOKEN="$(cat /vagrant/server_node_token/node-token)" sh -

curl -sfL https://get.k3s.io | sh -s - agent --server https://${MASTER_IP}:6443 --token "$(cat /vagrant/server_node_token/node-token)" --node-ip ${WORKER_IP}

