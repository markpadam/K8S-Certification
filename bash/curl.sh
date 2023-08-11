# Using the --header option to send a custom header
curl http://localhost:8080 --header "Hello World"

# Using the --insecure option to allow insecure server connections when using SSL
curl --insecure https://localhost:8080

# Using the --cacert option to specify a custom certificate authority
curl --cacert $CACERT -X GET https://kubernetes.default.svc/api/
curl --cacert $CACERT --header "Authorization: Bearer $TOKEN" -X GET https://kubernetes.default.svc/api/
curl --cacert $CACERT --header "Authorization: Bearer $TOKEN" -X GET https://kubernetes.default.svc/api/v1/namespaces/default/pods