# List all running processes
ps -A

# Display process with full format listing (-e for extra and -f for full)
ps -ef

# Display using UNIX format
ps -aux

# An example use case
ps -aux | grep etcd