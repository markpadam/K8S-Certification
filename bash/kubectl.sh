#common usefull flags

# set the command for the defined context
--context

# remove the headers from the output
--no-headers

# set the output format
-o wide
-o json
-o yaml
-o name

# Ruun the command in dry-run mode (along with -o yaml)
--dry-run

#kubectl Config
# set the current context
kubectl config use-context <context-name>

# get the current context
kubectl config current-context

# get the list of contexts
kubectl config get-contexts

# get the list of users
kubectl config get-users

# get the list of clusters
kubectl config get-clusters