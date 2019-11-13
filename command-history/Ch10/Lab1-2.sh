#!/bin/bash
### // Build the To Do List front-end container image,
 sudo podman build -t todo-frontend  .
 
## // Test the image
 sudo podman run --name testfrontend -d -p 8080:8080 todo-frontend
 
 curl -s localhost:8080 | grep h1
 sudo podman stop testfrontend
 sudo podman rm testfrontend
 git commit -a -m 'Fixed for OpenShift'
  git push
