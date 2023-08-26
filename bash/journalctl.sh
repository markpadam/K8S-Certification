# Searching logs with journalctl
journalctl -u kubelet.service
journalctl -u kubelet.service --since today
journalctl -u kubelet.service --since "2020-01-01 00:00:00" --until "2020-01-01 00:01:00"
journalctl -u kubelet.service | grep -i error

# Use no pager to enable line wrapping
journalctl -u kubelet.service --since today --no-pager
