
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
```bash
vagrant ssh ndormoyS
vagrant ssh ndormoySW
```

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

-------------------------------------------


Installer git :
sudo apt install git-all

Installer wget :
sudo apt-get install wget

Install zsh:
sudo apt install zsh -y

Installer OMZSH:
```bash
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

Installer VMBox :oc 
```bash
sudo apt install virtualbox
```
Activer la virtualisation imbriquee.


Installer Vagrant :
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant
```

Lancer le pr
