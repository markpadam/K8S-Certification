####### Storage Volumes #######

# Create a Persistant Volume
kubectl apply -f K8S/storage/PersistentVolume.yaml
# Get the PV
kubectl get pv pv0001
# Get the PV Details
kubectl describe pv pv0001
# Create a Persistant Volume Claim
kubectl apply -f K8S/storage/PersistentVolumeClaim.yaml
# Get the PVC
kubectl get pvc pvc0001
# Get the PVC Details
kubectl describe pvc pvc0001
# Create a pod which uses the PVC
kubectl create -f K8S/storage/storagePod.yaml
# Get the pod and volume details
kubectl get pods,pv,pvc
#--------------------------------------

