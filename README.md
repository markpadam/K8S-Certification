# Certified Kubernetes Administrator Study Notes
Certified Kubernetes Administrator Certification

Exam Curriculum (Topics): https://github.com/cncf/curriculum


## Handy Information

### Kubernetes Dashboard
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
kubectl proxy
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.
```

### kubectx - Power tools for kubectl

Check out the repo on GitHub: https://github.com/ahmetb/kubectx

### JSON Path Queries

He's a handy site I use convert json files: https://jsonpathfinder.com/

Basic syntax: (append to kubectl command such as ```kubectl get nodes```)
```
-o jsonpath='{.items[*].metadata.name}'
```

Searching with a jsonpath query: the first line uses * to select all items in the array and the second uses ?(@.user=='aws-user') to search the array for a user named aws-user
```
-o jsonpath="{.contexts[*].name}"
-o jsonpath="{.contexts[?(@.context.user=='aws-user')].name}"
```

## Exam Tips
### Kubernetes Official Documentation

During the exam you are able to open a browser tab to view the doc's on the Kubernetes website, I recommend bookmarking the below sites as soon as the exam begins:

```
https://kubernetes.io/docs/reference/
https://kubernetes.io/docs/reference/kubectl/cheatsheet/
https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
```

### Terminal
Its a performance based exam using a bash terminal so if your from a Windows background make sure you atleat know the basics! and learn to use vim (:wq)

You'll need at a very min to know ls,cat,grep,curl,ps
### Kubectl Alias

Having to type kubectl 100's of times during the exam gets boring (and takes up a load of time) so creat an alias to same time!

```
alias=k=kubectl
```

Now all you need to do to invoke the kubectl command is type k

### Bash Auto Complete
Bash auto complete is great for the exam and a real time saver but while learning kubernetes i'd recommend y=that you don't use it, its all too easy to use auto complete or just copy and paste commands into the terminal but i find you don't actuall learn well do that, typing in the commands each time while learning help you to build up muscle memory and remember (well atleast for me it does.)
```
apt-get install bash-completion
source =(kubectl completion bash)
```

### Auto Generate YAML Files
You can create a sample YAML deployment file by apending -o yaml to the end of imperative commands, you can also then send it to stnadard out with > file_name.yaml, here's an example:
```
kubectl run mypod --image=nginx --dry-run -o yaml > file_name.yaml
```

### Dry Run

You can use the --dry-run flag to test out commands without actually running them, this is great for testing out commands and generating YAML files.
```
--dry-run=server
--dry-run=client
```

## Check for Differences in deployments

Compare the current state of the cluster with the state defined in the YAML file
```
kubectl diff -f file_name.yaml
```
### Getting more information about a resource

```
kubectl describe <resource> <resource_name>
kubectl explain <resource>
```

### Common Aliases
- namespace = ns
- PersistantVolume = pv
- PersistantVolumeClaim = pvc
- ReplicaSet = rs
- Service = svc
- ServiceAccount = sa
- CertificateSigningRequest = csr


## ETCD

There a two versions of the ETCDCTL commands with version 2 being the default, to use version 3 of the API you will need to set the following environment variable:

```
export ETCDCTL_API=3
```

You must also specify the path to certificate files so that ETCDCTL can authenticate to the ETCD API Server. The certificate files are available in the etcd-master at the following paths:

```
--cacert /etc/kubernetes/pki/etcd/ca.crt
--cert /etc/kubernetes/pki/etcd/server.crt
--key /etc/kubernetes/pki/etcd/server.key
```

Example usage:
```
kubectl exec etcd-controlplane -n kube-system -- sh -c "ETCDCTL_API=3 etcdctl get / --prefix --keys-only --limit=10 --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/etcd/server.crt --key /etc/kubernetes/pki/etcd/server.key"
```


## Common Commands You Need to Know

### Kubectl

### etcdctl
```
etcdctl snapshot save <backup_name>
etcdctl endpoint health
etcdctl get
etcdctl put
```
### kubeadm
Basic steps for upgrading a node using kubeadm:
```
apt-get update
apt-get install kubeadm=1.27.0-00
kubeadm upgrade node
apt-get install kubelet=1.27.0-00 
systemctl daemon-reload
systemctl restart kubelet
```

## Random Topics to Learn

Linxu Namespaces: check out this video: https://www.youtube.com/watch?v=iN2RnYaFn-0

PS Command: https://www.youtube.com/watch?v=wYwGNgsfN3I (you'll want to watch this one at 1.25x speed)
Some common commands are ps -aux, ps -He, ps axjf

journalctl: https://www.youtube.com/watch?v=eClMJKPPUws

CoreDNS: https://www.youtube.com/watch?v=qRiLmLACYSY (skip the intro and start the video 6min in, by this point i'm watching everything at 1.5x) (Link to the repo referenced in the vid: https://github.com/vmware-archive/tgik/tree/master/episodes/147 )

iPTables:


## Links
CoreDNS: https://coredns.io/manual/toc/


## Storage

### Storage API Objects

- PersistentVolume (PV)
- PersistentVolumeClaim (PVC)
- StorageClass (SC)

### Access Modes

- ReadWriteOnce (RWO)
- ReadOnlyMany (ROX)
- ReadWriteMany (RWX)
- ReadWriteOncePod (RWOP)

### Reclaim Policy

- Retain
- Delete
- Recycle

### Service Types
For some parts of your application (for example, frontends) you may want to expose a Service onto an external IP address, one that's accessible from outside of your cluster.

Kubernetes Service types allow you to specify what kind of Service you want.

The available type values and their behaviors are:
#### ClusterIP
Exposes the Service on a cluster-internal IP. Choosing this value makes the Service only reachable from within the cluster. This is the default that is used if you don't explicitly specify a type for a Service. You can expose the Service to the public internet using an Ingress or a Gateway.
#### NodePort
Exposes the Service on each Node's IP at a static port (the NodePort). To make the node port available, Kubernetes sets up a cluster IP address, the same as if you had requested a Service of type: ClusterIP.
#### LoadBalancer
Exposes the Service externally using an external load balancer. Kubernetes does not directly offer a load balancing component; you must provide one, or you can integrate your Kubernetes cluster with a cloud provider.
#### ExternalName
Maps the Service to the contents of the externalName field (for example, to the hostname api.foo.bar.example). The mapping configures your cluster's DNS server to return a CNAME record with that external hostname value. No proxying of any kind is set up

## Internal DNS

Example Format:
podname.namespace.svc.cluster.local

## Running Commands in a Pod

Run a single command in a pod:
```
kubectl exec -it <pod_name> -- <command>
```
Enter into the shell:
```
kubectl exec -it <pod_name> -- /bin/bash
```

## Connecting to a Node

Connecting to a node is as simple as ssh'ing into it, you can find the IP address of the node by running the following command:
```
kubectl get nodes -o wide
```
or you can just use the hostname:
```
ssh <hostname>
```

## Creating a user with openssl certificate
Refer to /bash/openssl.sh for guidence on how to create a cert with openssl, then:
```
kubectl config set-credentials markpadam --client-certificate=/cert-location/markpadam.crt --client-key=/cert-location/markpadam.key
kubectl config set-context markpadam-context --cluster=minikube --namespace=default --user=markpadam
```

## Role Based Access Control (RBAC)
### Create a Role
Default Cluster Roles:
- cluster-admin
- admin
- edit
- view

Example of creating a role using kubectl
```
kubectl create role role-name --verb=list,get,wtach --resources=pods,deployments
```
### Create a RoleBinding
Create a Role Binding using kubectl
```
kubectl create rolebinding role-binding-name  --role=ready-only --user=markpadam
```

### Secrets
Create a Secret using kubectl
```
kubectl create secret generic secret-name --from-literal=key=value
```
Secrets are then mounted as volumes in pods, you can also use them as environment variables

## Scheduling
kube-scheduler is the component that is responsible for scheduling pods onto nodes. It does this by using a scheduling algorithm to determine which node is the best fit for a pod. The scheduler will take into account the following:
- Resource requirements
- Quality of Service (QoS) requirements
- Affinity and anti-affinity specifications
- Data locality
- Inter-workload interference
- Configurable policies and constraints
- Other factors, such as the hardware/software/policy constraints specified by the node

### Node Selectors
Node selectors allow you to constrain which nodes your pod is eligible to be scheduled on, based on labels on the node. In order to use node selectors, you must first add a label to the node:
```
kubectl label nodes <node-name> <label-key>=<label-value>
```

### Node Affinity
Node affinity allows you to constrain which nodes your pod is eligible to be scheduled on, based on labels on the node. In order to use node affinity, you must first add a label to the node:
```
kubectl label nodes <node-name> <label-key>=<label-value>
```
requiredDuringSchedulingIgnoredDuringExecution: The pod can only be scheduled to a node that matches the node affinity expressions. The pod will not be scheduled onto a node that does not match the expressions, even if the node is not yet running all of the pods that it is already scheduled to run.

preferredDuringSchedulingIgnoredDuringExecution: The pod can be scheduled onto a node that matches the node affinity expressions, but it is not a hard requirement. The pod will not be scheduled onto a node that does not match the expressions, even if the node is not yet running all of the pods that it is already scheduled to run.

podAntiAffinity: The pod can only be scheduled onto a node that does not match the node affinity expressions. The pod will not be scheduled onto a node that does match the expressions, even if the node is not yet running all of the pods that it is already scheduled to run.

podAntiAffinity: The pod can be scheduled onto a node that does not match the node affinity expressions, but it is not a hard requirement. The pod will not be scheduled onto a node that does match the expressions, even if the node is not yet running all of the pods that it is already scheduled to run.

### Taints and Tolerations
Taints allow a node to repel a set of pods. Taints are set on nodes, and allow a node to refuse to schedule pods that do not tolerate the taints. Tolerations are applied to pods, and allow a pod to schedule onto nodes with matching taints.

### Node Cordons
Node cordons allow you to mark a node as unschedulable, so that no new pods will be scheduled onto the node, but existing pods will continue to run on it.


## Networking
### Services
Services are an abstraction that defines a logical set of Pods and a policy by which to access them. Services enable a loose coupling between dependent Pods. A Service is defined using YAML (preferred) or JSON, like all Kubernetes objects.

### Service Discovery
Kubernetes supports two primary modes of finding a Service - environment variables and DNS.
