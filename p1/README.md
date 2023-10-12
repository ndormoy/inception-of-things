
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

On utilise la box centos 8, qui va etre notre systeme d'exploitation pour les machines virtuelles.

https://app.vagrantup.com/generic/boxes/centos8
```
Vagrant.configure("2") do |config|
  config.vm.box = "centos/8"
end
```

export VAGRANT_HOME=/path/to/external/disk/vagrant
default : ~/.vagrant.d




Ce qu'il faut tester :
```
ifconfig eth 1
```
```
kubectl get nodes -o wide
```