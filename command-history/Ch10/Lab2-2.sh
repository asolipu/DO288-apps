#!/bin/bash


source /usr/local/etc/ocp4.config

oc login -u ${RHT_OCP4_DEV_USER} -p ${RHT_OCP4_DEV_PASSWORD} ${RHT_OCP4_MASTER_API}
cd ~/DO288-apps/todo-backend

git checkout  review-service
oc project ${RHT_OCP4_DEV_USER}-review-service
## S2I custom changes
echo "Making s2I changes"

mkdir -p .s2i/bin
echo " COpying s2i scripts for backend"
cp -fv ~/DO288/labs/review-service/lifecycle.sh ./.s2i/bin

oc new-app --name backend --build-env npm_config_registry=http://${RHT_OCP4_NEXUS_SERVER}/repository/nodejs nodejs:6~https://github.com/${RHT_OCP4_GITHUB_USER}/DO288-apps#review-service --context-dir=todo-backend
oc set triggers dc/backend --from-config --remove
oc create -f configmap.yaml
oc set env dc/backend --from secret/tododb --prefix DATABASE_ --overwrite=true
oc set env dc/backend --from cm/todoapp --prefix DATABASE_ --overwrite=true

echo " Env variables for backend are"
oc set env dc/backend --list
oc set triggers dc/backend --auto
oc rollout latest dc/backend

oc expose svc/backend
BACKEND_HOST=$(oc get route/backend -o jsonpath '{.spec.host}')
echo "BACKEND_HOST is " $BACKEND_HOST
echo " Final Step 2 of LAb 2 done "
lab review-service grade
lab review-service finish
# lab review-service cleanup

