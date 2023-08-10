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

ETCDCTL_API=3 etcdctl --endpoints 192.36.57.27:2379 \
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

kubectl get event --field-selector involvedObject.name=red-probe-cka12-trb

kubectl -n admin2406 get deployment -o custom-columns=DEPLOYMENT:.metadata.name,CONTAINER_IMAGE:.spec.template.spec.containers[].image,READY_REPLICAS:.status.readyReplicas,NAMESPACE:.metadata.namespace --sort-by=.metadata.name > /opt/admin2406_data

kubectl --context cluster1 get pod -n kube-system kube-apiserver-cluster1-controlplane  -o jsonpath='{.metadata.labels.component}'

# Pull an image from a docker registry
kubectl --context cluster1 run nginx --image=nginx --restart=Never

# Create a configmap using kubectl examples
kubectl --context cluster1 create configmap nginx-config --from-literal=server_name=nginx --from-literal=server_port=80
kubectl --context cluster1 create configmap nginx-creds --from-literal=username=admin --from-literal=password=secret
# get details of the configmap
kubectl --context cluster1 get configmap nginx-config -o yaml

# label a node using kubectl
kubectl label node node1 hardware=GPU

# Taint a node using kubectl
kubectl taint node node1 key=myTaint:NoSchedule
kubectl taint node node1 key=myTaint:PreferNoSchedule
kubectl taint node node1 key=myTaint:NoExecute
# remove taint from a node
kubectl taint node node1 key:NoSchedule-
kubectl taint node node1 key:PreferNoSchedule-
kubectl taint node node1 key:NoExecute-

# Cordon a node using kubectl
kubectl cordon node1
kubectl drain node1 --ignore-daemonsets
# Uncordon a node using kubectl
kubectl uncordon node1

