# #!/bin/bash

# # Install K3s in controller mode
# curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server" sh -

# # Capture the server node token from /var/lib/rancher/k3s/server/node-token
# token=$(cat /var/lib/rancher/k3s/server/node-token)

# # Save the token to a file
# echo "$token" > /vagrant/server_node_token
