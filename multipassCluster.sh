#download multipass from http://multipass.run

# Create a cluster of 3 nodes
multipass launch --name master --cpus 2 --mem 2G --disk 10G
multipass launch --name node1 --cpus 2 --mem 2G --disk 10G
multipass launch --name node2 --cpus 2 --mem 2G --disk 10G

# Install k3s on the master node
multipass exec master -- bash -c "curl -sfL https://get.k3s.io | sh -"

# Get the IP address of the master node
#form a linux machine run:
K3S_URL=multipass info master | grep "IPv4" | awk '{print $2}'

# Get the k3s token from the master node
K3S_TOKEN=multipass exec master sudo cat /var/lib/rancher/k3s/server/node-token

# Join the other nodes to the cluster
curl -sfL https://get.k3s.io | K3S_URL=https://myserver:6443 K3S_TOKEN=mynodetoken sh -