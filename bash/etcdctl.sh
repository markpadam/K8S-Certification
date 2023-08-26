# Authorise etcdctl and take a snapshot of the etcd database
ETCDCTL_API=3 etcdctl --endpoints 192.14.129.16:2379 \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  snapshot save /file_path/snapshot.db

# Restore a snapshot of the etcd database
ETCDCTL_API=3 etcdctl --endpoints 192.14.129.16:2379 \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  snapshot restore /file_path/snapshot.db \
# After restoring the snapshot, you need to edit the etcd manifest file and change 
# the path of the etcd database to the restored snapshot.
# You can find the etcd manifest file in /etc/kubernetes/manifests/etcd.yaml

ETCDCTL_API=3 etcdctl --endpoints 192.14.129.16:2379 \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  member list

# Get metadata about the snapshot
ETCDCTL_API=3 etcdctl --write-out=table snapshot status /file_path/snapshot.db

# A better way to authenticate etcdctl using an environment variable
ENDPOINT=192.168.1.100:2379
ETCDCTL_API=3 etcdctl --endpoints $ENDPOINT \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \