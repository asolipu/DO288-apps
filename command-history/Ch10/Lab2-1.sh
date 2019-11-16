#!/bin/bash
history -c
lab review-service start
source /usr/local/etc/ocp4.config

oc login -u ${RHT_OCP4_DEV_USER} -p ${RHT_OCP4_DEV_PASSWORD} ${RHT_OCP4_MASTER_API}
cd ~/DO288-apps/todo-backend
## uncomment below section when running for first time
git checkout master
git checkout -b review-service
git push -u origin review-service

#git checkout  review-service
 oc new-project ${RHT_OCP4_DEV_USER}-review-service
 oc project ${RHT_OCP4_DEV_USER}-review-service
 
 oc new-app --name tododb --docker-image registry.access.redhat.com/rhscl/mysql-57-rhel7 -e MYSQL_USER=todoapp -e MYSQL_PASSWORD=mypass -e MYSQL_DATABASE=todo
oc get pod
oc expose svc/tododb
oc set triggers dc/tododb --from-config --remove
oc create -f ../command-history/Ch10/secret.yaml
oc set env dc/tododb --from secret/tododb --prefix MYSQL_ --overwrite=true

oc set triggers dc/tododb --auto
echo " Env variables for tododb are"
oc set env dc/tododb --list
oc rollout latest dc/tododb
echo " Step 1 done, now copy ~/DO288/labs/review-service/lifecycle.sh  to./.s2i/bin before doing the Step 2 \n"
exit 0




