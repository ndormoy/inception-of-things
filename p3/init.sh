#!/bin/sh

NAMESPACE_ARGO="argocd"
NAMESPACE_DEV="dev"

# create cluster
#k3d cluster create dev-cluster --api-port 6550 -p 8080:80@loadbalancer -p 8443:443@loadbalancer --agents 2
# kubectl cluster create my-k3d-cluster --api-port 6550 -p 8888:80
sudo k3d cluster create my-k3d-cluster --api-port 6443 -p 8888:80

# Create Namespaces
sudo kubectl create namespace argocd
sudo kubectl create namespace dev

# Install Argo CD
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Check if the pods are ready
are_all_pods_ready() {
  ready_pods=$(sudo kubectl get pods -n argocd 2>/dev/null | awk '$2 == "1/1" {print}' | wc -l)
  total_pods=$(sudo kubectl get pods -n $NAMESPACE_ARGO --no-headers | wc -l)
#   echo "Comparison result: [ $ready_pods -eq $total_pods ]"
  [ $ready_pods -eq $total_pods ]
}

# Wait until all pods are ready
echo "Waiting for all pods to be ready in namespace $NAMESPACE_ARGO..."

while ! are_all_pods_ready; do
  echo "Not all pods are ready. Waiting..."
  sleep 5
done

echo "All pods are now ready!"

#Argo UI by default will run on port 80. To access it on port 8090 or any other alternative port on the local machine, run the following command
sudo kubectl port-forward -n argocd svc/argocd-server 8080:443

# ! Open localhost:8080 on the web browser to view Argo CD UI
