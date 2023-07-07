# Certified Kubernetes Administrator Study Nodes
Certified Kubernetes Administrator Certification

Exam Curriculum (Topics): https://github.com/cncf/curriculum


## Exam Tips
### Kubernetes Official Documentation

During the exam you are able to open a browser tab to view the doc's on the Kubernetes website, I recommend bookmarking the below sites as soon as the exam begins:

```
https://kubernetes.io/docs/reference/
https://kubernetes.io/docs/reference/kubectl/cheatsheet/
```

### Terminal
Its a performance based exam using a bash terminal so if your from a Windows background make sure you atleat know the basics! and learn to use vim (:wq)

You'll need at a very min to know ls,cat,grep
### Kubectl Alias

Having to type kubectl 100's of times during the exam gets boring (and takes up a load of time) so creat an alias to same time!

```
alias = k=kubectl
```

Now all you need to do to invoke the kubectl command is type k



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
