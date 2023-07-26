# authorise etcdctl and take a snapshot of the etcd database
ETCDCTL_API=3 etcdctl --endpoints 192.14.129.16:2379 \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  snapshot save /file_path/snapshot.db