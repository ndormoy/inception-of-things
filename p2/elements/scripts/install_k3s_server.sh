#!/bin/bash

sudo -i
apk add curl

rm -rf /vagrant/server_node_token
mkdir -p /vagrant/server_node_token

export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --bind-address=$1 --flannel-iface=eth1"


echo "INSTALL_K3S_EXEC : ${INSTALL_K3S_EXEC}"
export KUBECONFIG="/etc/rancher/k3s/k3s.yaml"
echo "KUBECONFIG : ${KUBECONFIG}"

curl -sfL https://get.k3s.io | sh -

# Use a while loop to check if K3s is running
while :; do
    if /usr/local/bin/k3s kubectl get nodes 2>/dev/null | grep -q " Ready "; then
        echo "INFO: k3s is ready."
        break
    else
        echo "INFO: Waiting for k3s to start up..."
        sleep 3
    fi
done

chmod 755 -R /vagrant/server_node_token/

chmod 755 /etc/rancher/k3s/k3s.yaml
sudo cp /etc/rancher/k3s/k3s.yaml /vagrant/server_node_token/

echo "/etc/rancher/k3s/k3s.yaml : $(cat /etc/rancher/k3s/k3s.yaml)"