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

### Aliases
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


## Links
CoreDNS: https://coredns.io/manual/toc/


## Storage

### Access Modes

- RWO - ReadWriteOnce
- ROX - ReadOnlyMany
- RWX - ReadWriteMany
- RWOP - ReadWriteOncePod

## Service Types
For some parts of your application (for example, frontends) you may want to expose a Service onto an external IP address, one that's accessible from outside of your cluster.

Kubernetes Service types allow you to specify what kind of Service you want.

The available type values and their behaviors are:
## ClusterIP
Exposes the Service on a cluster-internal IP. Choosing this value makes the Service only reachable from within the cluster. This is the default that is used if you don't explicitly specify a type for a Service. You can expose the Service to the public internet using an Ingress or a Gateway.
## NodePort
Exposes the Service on each Node's IP at a static port (the NodePort). To make the node port available, Kubernetes sets up a cluster IP address, the same as if you had requested a Service of type: ClusterIP.
## LoadBalancer
Exposes the Service externally using an external load balancer. Kubernetes does not directly offer a load balancing component; you must provide one, or you can integrate your Kubernetes cluster with a cloud provider.
## ExternalName
Maps the Service to the contents of the externalName field (for example, to the hostname api.foo.bar.example). The mapping configures your cluster's DNS server to return a CNAME record with that external hostname value. No proxying of any kind is set up