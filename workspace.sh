_  __     _                          _
| |/ /   _| |__   ___ _ __ _ __   ___| |_ ___  ___
| ' / | | | '_ \ / _ \ '__| '_ \ / _ \ __/ _ \/ __|
| . \ |_| | |_) |  __/ |  | | | |  __/ ||  __/\__ \
|_|\_\__,_|_.__/ \___|_|  |_| |_|\___|\__\___||___/

### Some useful commands using realworld examples

## Using top to get resource usage
kubectl top nodes --context cluster1 --no-headers | sort -nr -k4 | head -1
kubectl top pods --sort-by=cpu
kubectl top pods --sort-by=memory
kubectl top pods --containers

## Troubleshoting commands
kubectl get event --field-selector involvedObject.name=red-probe-cka12-trb
# Get event with kubectl and sort by timestamp
kubectl get events --sort-by='.metadata.creationTimestamp'
# Search for events with kubectl by field selector
kubectl get events --field-selector type=Warning
kubectl get events --field-selector type=Warning,reasontype=failed
# check services are running at the OS level
systemctl status kubelet.service
# Ensure the service is set to start on boot
systemctl enable kubelet.service
# Start a stopped service
systemctl start kubelet.service




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


# Expose a deployment using kubectl
kubectl expose deployment nginx --port=80 --target-port=80 --name=nginx-service --type=NodePort
kubectl expose deployment nginx --port=80 --target-port=80 --name=nginx-service --type=ClusterIP
kubectl expose deployment nginx --port=80 --target-port=80 --name=nginx-service --type=LoadBalancer

# Get listing of emdpoints using kubectl
kubectl get endpoints nginx

# Export a certificate from config file then decode it
kubectl config view --raw -o jsonpath='{ .users[*].user.client-certificate-data }' | base64 --decode > admin.crt
openssl x509 -in admin.crt -text -noout | head -n 15

# Get pods using kubectl and use the verbose flag
kubectl get pods -v 6


# Accessing the API Server inside a Pod
# See how the secret is available inside the pod
PODNAME=$(kubectl get pods -l app=nginx -o jsonpath='{ .items[*].metadata.name }')
kubectl exec $PODNAME -it -- /bin/bash
ls /var/run/secrets/kubernetes.io/serviceaccount/
cat /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
cat /var/run/secrets/kubernetes.io/serviceaccount/namespace
cat /var/run/secrets/kubernetes.io/serviceaccount/token
# Load the token and cacert into variables for reuse
TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
CACERT=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
# You're able to authenticate to the API Server with the user...and retrieve some basic and safe information from the API Server
curl --cacert $CACERT -X GET https://kubernetes.default.svc/api/ # This will fail with a 403, but it's just to show you how to use the cacert
curl --cacert $CACERT --header "Authorization: Bearer $TOKEN" -X GET https://kubernetes.default.svc/api/
# But it doesn't have any permissions to access objects...this user is not authorized to access pods
curl --cacert $CACERT --header "Authorization: Bearer $TOKEN" -X GET https://kubernetes.default.svc/api/v1/namespaces/default/pods
# We can also use impersonation to help with our authorization testing
kubectl auth can-i list pods --as=system:serviceaccount:default:mysvcaccount1
kubectl get pods -v 6 --as=system:serviceaccount:default:mysvcaccount1


# View the kubernetes Certificate Authority
ls -la /etc/kubernetes/pki/
openssl x509 -in /etc/kubernetes/pki/ca.crt -text -noout | head -n 15

# Use kubectl to get a certificate signing request
kubectl get csr demouser -o jsonpath='{ .items[*].metadata.name }' | base64 --decode > demouser.cst


