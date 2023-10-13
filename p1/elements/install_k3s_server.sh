#!/bin/bash

# Fix the problem of Failed to download metadata for repo 'appstream'
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Install K3s in controller mode
# curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server" sh -

# # Set the desired server node IP address and install K3s in server mode
SERVER_IP="192.168.56.110"
# curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --node-ip=${SERVER_IP}" sh -

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --write-kubeconfig-mode '0644' --kubelet-arg 'config=/etc/rancher/k3s/kubelet.config' --node-ip ${SERVER_IP}" sh -


/usr/local/bin/k3s server --write-kubeconfig-mode 0644 --kubelet-arg "config=/etc/rancher/k3s/kubelet.config" --node-ip="${SERVER_IP}"

# sleep 10

# # Create directory for the Token
# mkdir /vagrant/server_node_token
mkdir -p /vagrant/server_node_token

# Copy the token to the shared directory
cp /var/lib/rancher/k3s/server/node-token /vagrant/server_node_token/

# Ensure the good persimissions for the server node token file
chmod 755 -R /vagrant/server_node_token

# Ensure the server kubernetes file has correct permissions
chmod 755 /etc/rancher/k3s/k3s.yaml
