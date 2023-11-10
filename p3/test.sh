#!/bin/sh

NAMESPACE_ARGO="argocd"
NAMESPACE_DEV="dev"

# Install Argo CD
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Check if the pods are ready
are_all_pods_ready() {
  ready_pods=$(sudo kubectl get pods -n argocd 2>/dev/null | awk '$2 == "1/1" {print}' | wc -l)
  total_pods=$(sudo kubectl get pods -n $NAMESPACE_ARGO --no-headers | wc -l)
  echo "Comparison result: [ $ready_pods -eq $total_pods ]"
  [ $ready_pods -eq $total_pods ]
}

# Wait until all pods are ready
echo "Waiting for all pods to be ready in namespace $NAMESPACE_ARGO..."

while ! are_all_pods_ready; do
  echo "Not all pods are ready. Waiting..."
  sleep 5
done

echo "All pods are now ready!"
