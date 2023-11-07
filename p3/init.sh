#TODO: read todolist on readme 

# create cluster
#k3d cluster create dev-cluster --api-port 6550 -p 8080:80@loadbalancer -p 8443:443@loadbalancer --agents 2
kubectl cluster create my-k3d-cluster --api-port 6550 -p 8888:80

# install k3d
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# kubectl create namespace dev

#! check if all pod are up
kubectl get pods -n argocd

#Argo UI by default will run on port 80. To access it on port 8090 or any other alternative port on the local machine, run the following command
kubectl port-forward -n argocd svc/argocd-server 8080:443

# ! Open localhost:8080 on the web browser to view Argo CD UI
