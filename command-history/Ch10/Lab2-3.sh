#!/bin/bash


source /usr/local/etc/ocp4.config

oc login -u ${RHT_OCP4_DEV_USER} -p ${RHT_OCP4_DEV_PASSWORD} ${RHT_OCP4_MASTER_API}
cd ~/DO288-apps/todo-backend

#git checkout  review-service

#oc project ${RHT_OCP4_DEV_USER}-review-service
## S2I custom changes
echo "Making s2I changes"

#mkdir -p .s2i/bin
#echo " COpying s2i scripts for backend"
#cp -fv ~/DO288/labs/review-service/lifecycle.sh ./.s2i/bin
## edit the lifecycle script with call to s2i assemble script of the image
oc describe istag nodejs:6 -n openshift \| grep io.openshift.s2i.scripts-url
# call /usr/libexec/s2i/assemble in your custom assemble script

oc describe istag nodejs:6 -n openshift \| grep io.openshift.s2i.scripts-url
# add
git add .s2i
git commit -am "Add custom assemble script"
git push

oc new-app --name backend --build-env npm_config_registry=http://${RHT_OCP4_NEXUS_SERVER}/repository/nodejs nodejs:6~https://github.com/${RHT_OCP4_GITHUB_USER}/DO288-apps#review-service --context-dir=todo-backend
-e DATABASE_NAME=todo -e DATABASE_USER=todoapp -e DATABASE_PASSWORD=mypass -e DATABASE_SVC=tododb 
echo " Sleeping for 10 sec"
sleep 10

oc set triggers dc/backend --from-config --remove
#oc create -f ~/command-history/Ch10/configmap.yaml
oc delete cm/todoapp
oc create cm todoapp --from-literal init=true
oc set env dc/backend --from secret/tododb --prefix DATABASE_ --overwrite=true
oc set env dc/backend --from cm/todoapp --prefix DATABASE_ --overwrite=true

echo " Env variables for backend are"
oc set env dc/backend --list
oc set triggers dc/backend --auto

oc rollout latest dc/backend

oc expose svc/backend

oc get pod

oc rsh <podname> env | grep DATABASE
BACKEND_HOST=$(oc get route/backend -o jsonpath '{.spec.host}')
echo "BACKEND_HOST is " $BACKEND_HOST
echo " Final Step 2 of LAb 2 done "
#  WAIT for 3 mins before running the grade script as build will not be finished.
##lab review-service grade
#lab review-service finish
# lab review-service cleanup

