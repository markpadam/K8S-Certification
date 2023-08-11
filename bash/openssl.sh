# openssl for working with certificates, you could also use cfssl but don't

#Create an openssl certificate
openssl genrsa -out server.key 2048
openssl genrsa -out myuser.key 2048

#Create a certificate signing request
openssl req -new -key server.key -out server.csr -subj "/CN=username/O=group"
openssl req -new -key myuser.key -out myuser.csr -subj "/CN=myuser"

#Sign the certificate with the Kubernetes CA (/etc/kubernetes/pki/ca.crt)
openssl x509 -req -in server.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out server.crt -days 365
openssl x509 -req -in myuser.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out myuser.crt -days 365

#View the Kubernetes CA certificate
openssl x509 -in /etc/kubernetes/pki/ca.crt -text -noout | head -n 15
