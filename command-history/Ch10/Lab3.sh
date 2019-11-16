#!/bin/bash                                                                        
                                                                                
                                                                                   
source /usr/local/etc/ocp4.config                                                  
                                                                                   
oc login -u ${RHT_OCP4_DEV_USER} -p ${RHT_OCP4_DEV_PASSWORD} ${RHT_OCP4_MASTER_API}
cd ~/DO288-apps/todo-backend   

oc project    

lab review-multicontainer start 

cp ~/DO288/labs/review-multicontainer/todoapp.yaml ~/DO288/labs/review-multicontainer/todoapp2.yaml



grep '^  kind:' ~/todoapp.yaml

oc process --parameters -f ~/todoapp.yaml

 oc get template nodejs-mongodb-example -n openshift -o yaml >reference_template.yaml
 
 vi ~/command-history/Ch10/todoapp.yaml
 
  oc project ${RHT_OCP4_DEV_USER}-review-common
  
  oc new-app -f ~/command-history/Ch10/todoapp.yaml -p PASSWORD=x -p HOSTNAME=y -p BACKEND=z --dry-run
  
   oc create -f ~/todoapp.yaml
   oc process todoapp --parameters
   oc new-project ${RHT_OCP4_DEV_USER}-review-multicontainer
   
    oc policy add-role-to-group -n ${RHT_OCP4_DEV_USER}-review-common system:image-puller
     \system:serviceaccounts:${RHT_OCP4_DEV_USER}-review-multicontainer
     
     
     $ oc new-app ${RHT_OCP4_DEV_USER}-review-common/todoapp
      \-p PASSWORD=redhat \-p CLEAN_DATABASE=false \-p HOSTNAME=todoui-${RHT_OCP4_DEV_USER}.${RHT_OCP4_WILDCARD_DOMAIN}
       \-p BACKEND=todoapi-${RHT_OCP4_DEV_USER}.${RHT_OCP4_WILDCARD_DOMAIN}
       
       oc logs -f bc/backend
       
        oc get pod
        
        
        oc get route
        
         curl -si \todoapi-youruser.apps.cluster.domain.example.com/todo/api/items-count // this will fail as DB is not initializes
         
         oc port-forward tododb-1-dvcqm 30306:3306
         
         mysql -h127.0.0.1 -P30306 -utodoapp -predhat todo \< ~/DO288/labs/review-multicontainer/todo.sql
         
         oc get pod
        
          oc rollout latest dc/backend
          
          oc get pod
          
          curl -si todoapi-${RHT_OCP4_DEV_USER}.${RHT_OCP4_WILDCARD_DOMAIN}/todo/api/items-count
          
           oc get route
          
           lab review-multicontainer grade
           
           lab review-multicontainer finish
        