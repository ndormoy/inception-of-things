#!/bin/sh

# install kubctl

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl



# install k3d
# curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

# Check if k3d is installed
if command -v k3d >/dev/null 2>&1; then
    echo "INFO: k3d is installed."
else
    echo "ERROR: k3d is not installed. Please install k3d."
    exit 1
fi
