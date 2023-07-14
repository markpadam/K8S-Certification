# Certified Kubernetes Administrator Study Nodes
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
```

### Terminal
Its a performance based exam using a bash terminal so if your from a Windows background make sure you atleat know the basics! and learn to use vim (:wq)

You'll need at a very min to know ls,cat,grep,curl
### Kubectl Alias

Having to type kubectl 100's of times during the exam gets boring (and takes up a load of time) so creat an alias to same time!

```
alias = k=kubectl
```

Now all you need to do to invoke the kubectl command is type k

### Auto Generate YAML Files
You can create a sample YAML deployment file by apending -o yaml to the end of imperative commands, you can also then send it to stnadard out with > file_name.yaml, here's an example:
```
kubectl run mypod --image=nginx --dry-run -o yaml > file_name.yaml
```

### Aliases
namespace = ns
PersistantVolume = pv
PersistantVolumeClaim = pvc
ReplicaSet = rs
Service = svc
ServiceAccount = sa


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

## Random Topics to Learn

Linxu Namespaces: check out this video: https://www.youtube.com/watch?v=iN2RnYaFn-0

PS Command: https://www.youtube.com/watch?v=wYwGNgsfN3I (you'll want to watch this one at 1.25x speed)
Some common commands are ps -aux, ps -He, ps axjf