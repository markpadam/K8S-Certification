kubectl --context cluster1 create serviceaccount deploy-cka20-arch
kubectl --context cluster1 create clusterrole deploy-role-cka20-arch --resource=deployments --verb=get
kubectl --context cluster1 create clusterrolebinding deploy-role-binding-cka20-arch --clusterrole=deploy-role-cka20-arch --serviceaccount=default:deploy-cka20-arch

kubectl get clusterrole red-role-cka23-arch -o json --context cluster1
echo "resource:deployments|verbs:get,list,watch" > /opt/red-sa-cka23-arch

kubectl top node --context cluster1 --no-headers | sort -nr -k4 | head -1
echo cluster3,cluster3-controlplane > /opt/high_memory_node

kubectl --context cluster1 create serviceaccount pink-sa-cka24-arch
kubectl --context cluster1 create clusterrole pink-role-cka24-arch --resource=* --verb=*
kubectl --context cluster1 create clusterrolebinding pink-role-binding-cka24-arch --clusterrole=pink-role-cka24-arch --serviceaccount=default:pink-sa-cka24-arch

kubectl create secret generic secure-sec-cka12-arch --from-literal=color=darkblue -n secure-sys-cka12-arch --context cluster3

kubectl get secret beta-sec-cka14-arch -o json --context cluster3 -n beta-ns-cka14-arch
kubectl get secret beta-sec-cka14-arch --context cluster3 -n beta-ns-cka14-arch -o json | jq .data.secret | tr -d '"' | base64 -d > /opt/beta-sec-cka14-arch

ETCDCTL_API=3 etcdctl --endpoints 192.24.158.12:2379 \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \ 

kubectl --context cluster1 get pod -n kube-system kube-apiserver-cluster1-controlplane  -o jsonpath='{.metadata.labels.component}'

cd /tmp
export RELEASE=$(curl -s https://api.github.com/repos/etcd-io/etcd/releases/latest | grep tag_name | cut -d '"' -f 4)
wget https://github.com/etcd-io/etcd/releases/download/${RELEASE}/etcd-${RELEASE}-linux-amd64.tar.gz
tar xvf etcd-${RELEASE}-linux-amd64.tar.gz ; cd etcd-${RELEASE}-linux-amd64
mv etcd etcdctl  /usr/local/bin

kubectl auth can-i get deployments --as=system:serviceaccount:default:deploy-cka19-trb
kubectl auth can-i get deployments --as=system:serviceaccount:default:deploy-cka19-trb
kubectl create clusterrolebinding deploy-cka19-trb-role-binding --clusterrole=deploy-cka19-trb-role --serviceaccount=default:deploy-cka19-trb
kubectl auth can-i get deployments --as=system:serviceaccount:default:deploy-cka19-trb

kubectl --context cluster1 create serviceaccount deploy-cka20-arch
kubectl --context cluster1 create clusterrole deploy-role-cka20-arch --resource=deployments --verb=get
kubectl --context cluster1 create clusterrolebinding deploy-role-binding-cka20-arch --clusterrole=deploy-role-cka20-arch --serviceaccount=default:deploy-cka20-arch
kubectl --context cluster1 auth can-i get deployments --as=system:serviceaccount:default:deploy-cka20-arch

kubectl exec -it cyan-white-cka28-trb -- sh

kubectl get rolebinding -o yaml | grep -B 5 -A 5 thor-cka24-trb