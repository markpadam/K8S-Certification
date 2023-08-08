# Pull image from contriner registry
ctr images pull docker.io/library/nginx:latest

# list images
ctr images list

# Tag an image
ctr images tag docker.io/library/nginx:latest docker.io/library/myimage:latest

# Push an image to a registry
ctr images push docker.io/library/myimage:latest