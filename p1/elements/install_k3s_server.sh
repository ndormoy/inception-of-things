#!/bin/bash

# Fix the problem of Failed to download metadata for repo 'appstream'
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Install K3s in controller mode
# curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server" sh -

# # Set the desired server node IP address and install K3s in server mode
SERVER_IP="192.168.56.110"

sudo systemctl disable firewalld --now
# sudo ufw allow 6443/tcp

K3S_COMMAND="--write-kubeconfig-mode=644 --tls-san 'ndormoyS' --node-ip ${SERVER_IP}  --bind-address=${SERVER_IP} --advertise-address=${SERVER_IP} "
# K3S_COMMAND="--write-kubeconfig-mode=644 --node-ip ${SERVER_IP}"

curl -sfL https://get.k3s.io |  INSTALL_K3S_EXEC="${K3S_COMMAND}" sh -

# sleep 10

LOGFILE="k3s_startup.log"

while :; do
    if /usr/local/bin/k3s kubectl get nodes 2>>"$LOGFILE" | grep -q " Ready "; then
        echo "[$(date +'%m_%d__%H:%M:%S')] INFO: k3s is ready."
        break
    else
        echo "[$(date +'%m_%d__%H:%M:%S')] INFO: Waiting for k3s to start up..."
        sleep 3
    fi
done


# # Create directory for the Token
mkdir -p /vagrant/server_node_token

# Copy the token to the shared directory
cp /var/lib/rancher/k3s/server/node-token /vagrant/server_node_token/

# Ensure the good persimissions for the server node token file
chmod 755 -R /vagrant/server_node_token

# Ensure the server kubernetes file has correct permissions
chmod 755 /etc/rancher/k3s/k3s.yaml

sudo mkdir -p ~/.kube 

sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config

# sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo cp /etc/rancher/k3s/k3s.yaml /vagrant/server_node_token/k3s.yaml
