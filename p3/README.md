1) ```run install_docker.sh```
2) ```run install_k3d.sh```
3) ```run init.sh```

## Difference between k3s and k3d

k3d is a tol for running k3s cluster insde Docker containers, mainly for local development abd test.  
ON the other hand, k3s is a standalone lightweight Kubernetes distribution designed for resource-constrained environments, emphasizing simplicity and ease of use.  
You might use k3d when you want to run k3s clusters wihtin Docker containers, and you might use k3s when you need a lightweight Kubernetes distribution for specific deployment scenarios.  

----------

## Commandes :

```sudo k3d cluster list``` --> Show cluster list  
```sudo kubectl get namespaces``` --> Get namespaces  



install argocd in namespace argocd --> ```sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml```  
Delete previous cmd :  ```sudo kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml```

<!-- This command retrieves the service information for the ArgoCD namespace using kubectl. -->
```sudo kubectl get svc -n argocd``` --> is used to retrieve information about the services in the argocd namespace of a Kubernetes cluster


### Connect to ArgoCD UI
The login is : admin  

```sudo kubectl get secret argocd-initial-admin-secret -n <mynamespace> -o yaml``` --> Get the password

o yaml  
apiVersion: v1  
data:  
  password: blablabla  
kind: Secret  
metadata:  
  creationTimestamp: "2023-11-10T14:51:30Z"  
  name: argocd-initial-admin-secret  
  namespace: argocd  
  resourceVersion: "5433"  
  uid: 0bdb49c4-ff41-49f8-9595-6dda685be60a  
type: Opaque  

After decode the password :  
```echo blablabla | base64 --decode```


We can now connect to the ArgoCD UI at the URL 127.0.0.1:8080  

Faster solution : 
```kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode && echo```



### Configure ArgoCD

The img : https://hub.docker.com/r/wil42/playground  
docker pull wil42/playground:v1  


1) Create the configuration files and put them into a git repository
2) put the img path in it
3) ```sudo k3d kubeconfig get my-k3d-cluster > ~/.kube/config-my-k3d-cluster``` --> Put the kubeconfig file in the right place
4) ```sudo export KUBECONFIG=~/.kube/config-my-k3d-cluster``` --> Change the kubeconfig path to the right place
4) ```kubectl apply -f application.yaml``` file --> create or update resources in a Kubernetes cluster based on the definitions provided in the YAML file