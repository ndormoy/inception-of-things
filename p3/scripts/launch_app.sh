sudo k3d kubeconfig get my-k3d-cluster > ~/.kube/config-my-k3d-cluster
export KUBECONFIG=~/.kube/config-my-k3d-cluster
sudo kubectl apply -f ../confs/application.yaml