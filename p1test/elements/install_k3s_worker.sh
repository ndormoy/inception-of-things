#!/bin/bash

sudo -i
apk add curl
export KUBECONFIG="/etc/rancher/k3s/k3s.yaml"
echo "KUBECONFIG : ${KUBECONFIG}"
export K3S_TOKEN_FILE=/vagrant/server_node_token/node-token

echo "K3S_TOKEN_FILE : ${K3S_TOKEN_FILE}"
export K3S_URL=https://$1:6443
echo "K3S_URL : ${K3S_URL}"
export INSTALL_K3S_EXEC="--flannel-iface=eth1"
echo "INSTALL_K3S_EXEC : ${INSTALL_K3S_EXEC}"
curl -sfL https://get.k3s.io | sh -

ifconfig eth1 broadcast 192.168.56.255
sudo cp /vagrant/server_node_token/k3s.yaml /etc/rancher/k3s/k3s.yaml
echo "/etc/rancher/k3s/k3s.yaml : $(cat /etc/rancher/k3s/k3s.yaml)"
