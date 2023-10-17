#!/bin/bash

# sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Install K3s in agent mode
# The port 6443 is commonly used for the Kubernetes API server
# This command downloads the K3s installation script, sets the K3S_URL and K3S_TOKEN environment variables to connect to the K3s server on ndormoyS using port 6443

MASTER_IP="192.168.56.110"
WORKER_IP="192.168.56.111"  
# curl -sfL https://get.k3s.io | K3S_URL="https://ndormoyS:6443" K3S_TOKEN="$(cat /vagrant/server_node_token/node-token)" sh -


# curl -sfL https://get.k3s.io | K3S_URL="https://${MASTER_IP}:6443" K3S_TOKEN="$(cat /vagrant/server_node_token/node-token)" sh -

# curl -sfL https://get.k3s.io | sh -s - agent --server https://${MASTER_IP}:6443 --token "$(cat /vagrant/server_node_token/node-token)" --node-ip ${WORKER_IP}

# curl -sfL https://get.k3s.io | K3S_TOKEN="$(cat /vagrant/server_node_token/node-token)"  sh -s - agent --server https://${MASTER_IP}:6443 --node-ip ${WORKER_IP}


sudo systemctl disable firewalld --now
# sudo ufw allow 6443/tcp
echo "LOLILOL"
sudo mkdir -p ~/.kube
sudo cp /vagrant/server_node_token/k3s.yaml ~/.kube/config

TOKEN="$(cat /vagrant/server_node_token/node-token)"
# TOKEN="/vagrant/server_node_token/node-token"

echo "BLABLA : token = $TOKEN"
# sudo su
# export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
export KUBECONFIG="/vagrant/server_node_token/k3s.yaml"

K3S_COMMAND="agent --server https://${MASTER_IP}:6443 --flannel-iface eth1 --token ${TOKEN} --node-ip ${WORKER_IP} --node-name 'ndormoySW'"

echo "BLABLA  K3S_COMMAND: $K3S_COMMAND"

# curl -sfL https://get.k3s.io | sh -
curl -sfL https://get.k3s.io |  INSTALL_K3S_EXEC="${K3S_COMMAND}" sh -


