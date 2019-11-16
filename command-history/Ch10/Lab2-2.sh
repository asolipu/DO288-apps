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
