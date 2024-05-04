#!/bin/sh

NAMESPACE_ARGO="argocd"
NAMESPACE_DEV="dev"

# create cluster
sudo k3d cluster create my-k3d-cluster --api-port 6443 -p 8888:80

# Create Namespaces
sudo kubectl create namespace argocd
sudo kubectl create namespace dev
sudo kubectl create namespace gitlab

# Install Argo CD
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Check if the pods are ready
are_all_pods_ready() {
  ready_pods=$(sudo kubectl get pods -n argocd 2>/dev/null | awk '$2 == "1/1" {print}' | wc -l)
  total_pods=$(sudo kubectl get pods -n $NAMESPACE_ARGO --no-headers | wc -l)
  [ $ready_pods -eq $total_pods ] && [ $ready_pods -ne 0 ]
}

# Wait until all pods are ready
echo "Waiting for all pods to be ready in namespace $NAMESPACE_ARGO..."

while ! are_all_pods_ready; do
  echo "Not all pods are ready. Waiting..."
  sleep 5
done

echo "All pods are now ready!"

# Display the password for argoCD UI
echo "Login: admin\nPassword: "
sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode > .password.txt

# Permit to access the Argo CD UI on port 8080 --> go to web browser and 127.0.0.1:8080, we can acces to the Argo CD UI now
sudo kubectl port-forward -n argocd svc/argocd-server 8080:443

# ! Open localhost:8080 on the web browser to view Argo CD UI
