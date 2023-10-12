# inception-of-things
Introduction to Kubernetes


Install Vagrant: Make sure you have Vagrant installed on your host machine.
Step 1: Create a Project Directory:
Create a directory for your project and navigate to it in your terminal.

```
mkdir vagrant-k3s-cluster
cd vagrant-k3s-cluster
Step 2: Initialize Vagrant Environment:
Initialize a Vagrant environment and define the configuration in a Vagrantfile.
```

Create a Vagrantfile in your project directory with the following contents:

```
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64" # You can use a different box if you prefer

  # Define the first machine (Server)
  config.vm.define "your_team_member_S" do |server|
    server.vm.network "private_network", type: "dhcp"
    server.vm.network "private_network", type: "static", ip: "192.168.56.110"
    server.vm.hostname = "Server"
    server.vm.provider "virtualbox" do |vb|
      vb.memory = 512
      vb.cpus = 1
    end
  end

  # Define the second machine (ServerWorker)
  config.vm.define "your_team_member_SW" do |worker|
    worker.vm.network "private_network", type: "dhcp"
    worker.vm.network "private_network", type: "static", ip: "192.168.56.111"
    worker.vm.hostname = "ServerWorker"
    worker.vm.provider "virtualbox" do |vb|
      vb.memory = 512
      vb.cpus = 1
    end
  end
end
```


Make sure to replace "your_team_member_S" and "your_team_member_SW" with the actual login names of your team members.

Step 3: Provision the Machines:
Provision the virtual machines using Vagrant:

```
vagrant up
```
This will create and start the virtual machines.

Step 4: SSH Key Configuration:
To enable passwordless SSH login, you'll need to configure SSH key authentication. You can use the vagrant user for this purpose. Ensure you have your SSH public key added to the ~/.ssh/authorized_keys file on each machine.

On your host machine:

```
# Assuming your public key is in ~/.ssh/id_rsa.pub
cat ~/.ssh/id_rsa.pub
```
Copy the contents of your public key and SSH into both VMs to configure passwordless SSH:

```
# SSH into the first machine (Server)
vagrant ssh your_team_member_S

# Inside the VM, add your public key to the authorized_keys file
echo "PASTE_YOUR_PUBLIC_KEY_HERE" >> ~/.ssh/authorized_keys

# Exit the VM
exit
```

# SSH into the second machine (ServerWorker) and repeat the process
vagrant ssh your_team_member_SW
echo "PASTE_YOUR_PUBLIC_KEY_HERE" >> ~/.ssh/authorized_keys
exit
Step 5: Install K3s and kubectl:
Now, you can install K3s and kubectl on the respective machines.

On the first machine (Server), install K3s in controller mode:

```
vagrant ssh your_team_member_S
curl -sfL https://get.k3s.io | sh -
```
On the second machine (ServerWorker), install K3s in agent mode:

```
vagrant ssh your_team_member_SW
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=YOUR_TOKEN sh -
```
Make sure to replace YOUR_TOKEN with the token from the first machine's K3s installation. The token is usually available in the /var/lib/rancher/k3s/server/token file on the Server machine.

Step 6: Install kubectl:
You can install kubectl on your host machine, or if you prefer to install it on the VMs, you can do so with the following commands:

On the Server machine:

```
vagrant ssh your_team_member_S
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
```
On the ServerWorker machine:

```
vagrant ssh your_team_member_SW
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
```
You now have two virtual machines set up with K3s installed, and you can use kubectl to manage your Kubernetes cluster.

Please note that the installation steps may change if there are updates or changes in the tools. Ensure that you use the latest installation instructions if needed.