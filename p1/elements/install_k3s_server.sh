#!/bin/bash

# # Fix the problem of Failed to download metadata for repo 'appstream'
# sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# # Install K3s in controller mode
# curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server" sh -

# # # Capture the server node token from /var/lib/rancher/k3s/server/node-token
# # token=$(cat /var/lib/rancher/k3s/server/node-token)

# # # Save the token to a file
# # echo "$token" > /vagrant/server_node_token


# sleep 10

# # ls -l /var/lib/rancher/k3s/server/
# mkdir /vagrant/server_node_token

# cp /var/lib/rancher/k3s/server/node-token /vagrant/server_node_token/
# chmod 755 -R /vagrant/server_node_token 