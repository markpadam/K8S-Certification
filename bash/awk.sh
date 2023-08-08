# print the first column
kubectl get pods | awk '{print $1}'
# or print the second column etc
kubectl get pods | awk '{print $2}'

# set the field separator to ","
kubectl get pods | awk -F, '{print $1}'
# or set the field separator to ":"
kubectl get pods | awk -F: '{print $1}'

# print multiple columns
kubectl get pods | awk '{print $1,$2}'
# print multiple columns with a separator
kubectl get pods | awk '{print $1 "|" $2}'

# print the last column
kubectl get pods | awk '{print $NF}'
# print last column after the / separator
kubectl get pods | awk -F/ '{print $NF}'

# print the lines which match the pattern "SearchString"
kubectl get pods | awk '/SearchString/ {print $0}'