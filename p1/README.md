
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

Pour se connecter en SSH :
vagrant ssh ndormoyS
vagrant ssh ndormoySW


k3s doc:
https://docs.k3s.io/installation/network-options


Ce qu'il faut tester :
```
ifconfig eth1
```
```
kubectl get nodes -o wide
```

kubectl cluster-info | grep 'KubeAPI server'

hostname

curl -sfL https://get.k3s.io | K3S_URL="https://192.168.56.110:6443" K3S_TOKEN="$(cat /vagrant/server_node_token/node-token)" sh -