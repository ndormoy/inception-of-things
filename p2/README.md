
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

```
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
127.0.0.1	localhost ndormoy.42.fr exemple2.fr
255.255.255.255	broadcasthost
::1             localhost
192.168.56.110 app1.com
192.168.56.110 app2.com
192.168.56.110 app3.com

6# Added by Docker Desktop
# To allow the same kube context to work on the host and the container:
127.0.0.1 kubernetes.docker.internal
# End of section

```