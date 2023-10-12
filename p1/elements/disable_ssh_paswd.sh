#!/bin/sh

# Ensure SSH directory exists
mkdir -p ~/.ssh

# Generate SSH key pair (if not already generated)
if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
fi

# Copy the public key to the authorized_keys file for passwordless SSH
if [ -f ~/.ssh/id_rsa.pub ]; then
  cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
fi

# Set permissions
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

# Disable password authentication in SSH
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

# Restart SSH
if [ -x /etc/init.d/ssh ]; then
  /etc/init.d/ssh restart
elif [ -x /etc/init.d/sshd ]; then
  /etc/init.d/sshd restart
fi