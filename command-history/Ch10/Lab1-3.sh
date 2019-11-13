 #!/bin/bash
  cd ~
 sudo podman login -u ${RHT_OCP4_QUAY_USER} quay.io
 sudo skopeo copy containers-storage:localhost/todo-frontend docker://quay.io/{RHT_OCP4_QUAY_USER}/todo-frontend:latest
 oc project ${RHT_OCP4_DEV_USER}-review-common
   podman login -u ${RHT_OCP4_QUAY_USER} quay.io
  oc create secret generic quayio --from-file .dockerconfigjson=${XDG_RUNTIME_DIR}/containers/auth.json --type kubernetes.io/dockerconfigjson
  oc secrets link default quayio --for pull
  oc import-image todo-frontend --from quay.io/{RHT_OCP4_QUAY_USER}/todo-frontend:latest --confirm
  oc adm policy add-role-to-group system:registry system:serviceaccounts:${RHT_OCP4_DEV_USER}-review-dockerfile
  oc adm policy add-role-to-group system:image-puller system:serviceaccounts:${RHT_OCP4_DEV_USER}-review-dockerfile

 oc get is todo-frontend
 
 oc project ${RHT_OCP4_DEV_USER}-review-dockerfile
 oc new-app --name frontend -i ${RHT_OCP4_DEV_USER}-review-common/todo-frontend  -e BACKEND_HOST=api.example.com
 oc get pods
 oc expose svc/frontend
 oc get route/frontend
 FRONTEND_URL=$(oc get route/frontend -o jsonpath '{.spec.host}')
 curl -si $FRONTEND_URL | grep h1
 lab review-dockerfile grade
