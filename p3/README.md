TODO: need to make a script that install everything. cf "You will need Docker for K3d to work, and probably some other
softwares too. Thus, you have to write a script to install every
necessary packages and tools during your defense."

TODO:  The only mandatory
requirement is to put the login of a member of the group in the name
of your repository.

## Difference between k3s and k3d

k3d is a tol for running k3s cluster insde Docker containers, mainly for local development abd test.  
ON the other hand, k3s is a standalone lightweight Kubernetes distribution designed for resource-constrained environments, emphasizing simplicity and ease of use.  
You might use k3d when you want to run k3s clusters wihtin Docker containers, and you might use k3s when you need a lightweight Kubernetes distribution for specific deployment scenarios.  

----------

## Commandes :

sudo k3d cluster list --> Show cluster list
sudo kubectl get namespaces --> Get namespaces


sudo kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml --> Delete this cmd : sudo kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml  

<!-- This command retrieves the service information for the ArgoCD namespace using kubectl. -->
sudo kubectl get svc -n argocd --> 