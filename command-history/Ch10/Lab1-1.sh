#!/bin/bash
history -c
lab review-dockerfile start
source /usr/local/etc/ocp4.config

oc login -u ${RHT_OCP4_DEV_USER} -p ${RHT_OCP4_DEV_PASSWORD} ${RHT_OCP4_MASTER_API}
cd ~/DO288-apps/todo-frontend
git checkout master

git checkout -b review-dockerfile
git push -u origin review-dockerfile

 oc new-project ${RHT_OCP4_DEV_USER}-review-dockerfile
 oc new-project ${RHT_OCP4_DEV_USER}-review-common
 
