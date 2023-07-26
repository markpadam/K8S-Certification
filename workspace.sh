kubectl --context cluster1 create serviceaccount deploy-cka20-arch
kubectl --context cluster1 create clusterrole deploy-role-cka20-arch --resource=deployments --verb=get
kubectl --context cluster1 create clusterrolebinding deploy-role-binding-cka20-arch --clusterrole=deploy-role-cka20-arch --serviceaccount=default:deploy-cka20-arch


kubectl get clusterrole red-role-cka23-arch -o json --context cluster1
echo "resource:deployments|verbs:get,list,watch" > /opt/red-sa-cka23-arch


kubectl top node --context cluster1 --no-headers | sort -nr -k4 | head -1
kubectl top node --context cluster2 --no-headers | sort -nr -k4 | head -1
echo cluster3,cluster3-controlplane > /opt/high_memory_node

