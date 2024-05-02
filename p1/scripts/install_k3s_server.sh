#!/bin/bash

# sudo -i
sudo apk add curl

sudo rm -rf /vagrant/confs/server_node_token
sudo mkdir -p /vagrant/confs/server_node_token

# export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --bind-address=#{S_IP} --node-external-ip=#{S_IP} --flannel-iface=eth1"
export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --bind-address=$1 --flannel-iface=eth1"


echo "INSTALL_K3S_EXEC : ${INSTALL_K3S_EXEC}"
export KUBECONFIG="/etc/rancher/k3s/k3s.yaml"
echo "KUBECONFIG : ${KUBECONFIG}"

sudo curl -sfLk https://get.k3s.io | sh -

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

sudo cp /var/lib/rancher/k3s/server/node-token /vagrant/confs/server_node_token/
echo "/var/lib/rancher/k3s/server/node-token : $(cat /var/lib/rancher/k3s/server/node-token)"
sudo chmod 755 -R /vagrant/confs/server_node_token/

sudo chmod 755 /etc/rancher/k3s/k3s.yaml
sudo cp /etc/rancher/k3s/k3s.yaml /vagrant/confs/server_node_token/

echo "/etc/rancher/k3s/k3s.yaml : $(cat /etc/rancher/k3s/k3s.yaml)"