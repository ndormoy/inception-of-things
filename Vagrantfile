#-----------------------------Variables---------------------------------
IMAGE = "centos/8"

MEMORY = "2048"
CPUS = "2"

S_HOSTNAME = "ndormoyS"
W_HOSTNAME = "ndormoyW"

S_IP = "192.168.56.110"
W_IP = "192.168.56.111"


#-----------------------------Base Configuration------------------------
Vagrant.configure("2") do |config|
  config.vm.box = [IMAGE]
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
    # Customize the amount of memory on the VM:
    vb.memory = [MEMORY]
    vb.cpus = [CPUS]
  end

  #---------------------------Server------------------------------------
  config.vm.define "ndormoyS" do |server|
    server.vm.hostname = "S_HOSTNAME"
    server.vm.network "private_network", type: "dhcp"
    server.vm.network "private_network", ip: [S_IP]
  end


  #---------------------------Worker------------------------------------
  config.vm.define "ndormoySW" do |worker|
    worker.vm.hostname = "W_HOSTNAME"
    worker.vm.network "private_network", type: "dhcp"
    worker.vm.network "private_network", ip: [W_IP]
  end

end



  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Disable the default share of the current code directory. Doing this
  # provides improved isolation between the vagrant box and your host
  # by making sure your Vagrantfile isn't accessable to the vagrant box.
  # If you use this you may want to enable additional shared subfolders as
  # shown above.
  # config.vm.synced_folder ".", "/vagrant", disabled: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
