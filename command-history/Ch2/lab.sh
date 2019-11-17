  #!/bin/bash
  lab design-container start
source /usr/local/etc/ocp4.config
oc login -u ${RHT_OCP4_DEV_USER} -p ${RHT_OCP4_DEV_PASSWORD} ${RHT_OCP4_MASTER_API}
   
   oc new-project ${RHT_OCP4_DEV_USER}-design-container
   #git checkout master
   
  # git push --delete origin design-container
   
  git checkout design-container
   # git push -u origin design-container 
   
  oc new-app --name elvis https://github.com/${RHT_OCP4_GITHUB_USER}/DO288-apps#design-container --context-dir hello-java
  
  oc logs -f bc/elvis
  sleep 30
  #vi Dockerfile
#  git add .
#  git commit -am " Dockerfile changes for OCP"
#  git push
 # oc start-build bc/elvis --follow
  oc create cm appconfig --from-literal APP_MSG="Elvis lives"
  oc set env dc/elvis --from configmap/appconfig
   oc set env dc/elvis --list
   oc expose svc/elvis 
   curl elvis-${RHT_OCP4_DEV_USER}-design-container.${RHT_OCP4_WILDCARD_DOMAIN}/api/hello
    lab design-container grade
    lab design-container finish
