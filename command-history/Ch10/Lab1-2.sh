#!/bin/bash
### Build the To Do List front-end container image,
source /usr/local/etc/ocp4.config
oc login -u ${RHT_OCP4_DEV_USER} -p ${RHT_OCP4_DEV_PASSWORD} ${RHT_OCP4_MASTER_API}
git checkout  review-dockerfile
cd ~/DO288-apps/todo-frontend
 sudo podman build -t todo-frontend  .
 
## // Test the image
 sudo podman run --name testfrontend -d -p 8080:8080 todo-frontend
 
 curl -s localhost:8080 | grep h1
 sudo podman stop testfrontend
 sudo podman rm testfrontend
 git commit -a -m 'Fixed for OpenShift'
  git push
