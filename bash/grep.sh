# Use -A to print lines after the match
kubectl get pods | grep -A 1 "SearchString"

# Use -B to print lines before the match
kubectl get pods | grep -B 1 "SearchString"

# Combine -A and -B to print lines before and after the match
kubectl get pods | grep -A 1 -B 1 "SearchString"

# Use -C to print lines before and after the match.
kubectl get pods | grep -C 1 "SearchString"