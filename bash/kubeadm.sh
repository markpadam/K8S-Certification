# plan the upgrade
kubeadm upgrade plan

# Use this command to upgrade the control plane components to the latest version
kubeadm upgrade apply v1.20.0

# Use this command to see the difference between the current and the target configuration
kubeadm upgrade diff v1.20.0

# Upgrade the kubelet and kubectl packages on all control plane nodes
kubeadm upgrade node

#Detailed steps can be found in the Kubernetes documentation: Upgrading kubeadm clusters.