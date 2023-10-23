
Commandes Vagrant :
- **vagrant init** : initialise le fichier Vagrantfile
- **vagrant up** : demarre la machine virtuelle
- **vagrant ssh** : se connecte a la machine virtuelle --> vagrant ssh ndormoyS
- **vagrant halt** : eteint la machine virtuelle
- **vagrant destroy** : detruit la machine virtuelle
- **vagrant reload** : recharge la machine virtuelle
- **vagrant status** : affiche le status de la machine virtuelle
- **vagrant box list** : liste les box disponibles
- **vagrant box add** : ajoute une box
- **vagrant box remove** : supprime une box

Doc Valgrant :
https://developer.hashicorp.com/vagrant/docs/networking/private_network

https://kubernetes.io/docs/concepts/services-networking/service/

code /etc/hosts

kubectl get pods
kubectl get services
kubectl get ingress
curl -H "Host:app1.com" 192.168.56.110

kubectl describe pod app1-6757b6db4b-mvb9x

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/cloud/deploy.yaml


http://app1.com

kubectl logs app1-889477cc5-rqcq6 -n default