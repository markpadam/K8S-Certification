# syntax:
[COMMAND] <<[-] 'DELIMITER'
    Line 1
    Line 2
    ...
DELIMITER


# Examples:
cat << EOF
The current working directory is: $PWD
You are logged in as: $(whoami)
EOF

ssh user@<server-ip-address> <<EOF
    "SSH connected user name: \$USER"
    "Current user name: $USER"
EOF

# Example of using the kubectl apply command and passing in the yaml file as a heredoc
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: pod-name
  namespace: default
  spec:
containers:
  - name: container-one
    image: nginx
    ports:
      - containerPort: 80
EOF

# Guide
https://ostechnix.com/bash-heredoc-tutorial

