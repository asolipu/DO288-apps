943  source /usr/local/etc/ocp4.config
  944  oc login -u ${RHT_OCP4_DEV_USER} -p ${RHT_OCP4_DEV_PASSWORD} ${RHT_OCP4_MASTER_API}
  945  lab review-multicontainer start
  946  oc project 
  947  oc project ${RHT_OCP4_DEV_USER}-review-common
  948  git branch
  949  cd ~/DO288-apps/
  950  git branch
  951  mkdir solutions
  952  cp -rfv ~/DO288/solutions/ solutions
  953  rm -rf solutions
  954  cp -rfv ~/DO288/solutions/ .
  955  ls
  956  git status
  957  git add solutions/
  958  git commit -am "wip"
  959  git push
  960  git pull
  961  git status
  962  git push
  963  grep '^  kind' ~/command-history/Ch10/todoapp.yaml 
  964  oc process -f  ~/command-history/Ch10/todoapp.yaml --parameters
  965  oc project openshift
  966  oc describe template nodejs-mongodb-example -n openshift
  967  oc get template nodejs-mongodb-example -n openshift --export > nodejs-eample.yaml
  968  vi nodejs-eample.yaml 
  969  oc get --help
  970  oc get template openshift/nodejs-mongodb-example  --export 
  971  oc get template/nodejs-mongodb-example  --export 
  972  oc get template/nodejs-mongodb-example  --export -n openshift
  973  oc get template/nodejs-mongodb-example  --export=true -n openshift
  974  oc get template/nodejs-mongodb-example -n openshift -o yaml > nodejs-mongodb-example.yaml
  975  cp nodejs-mongodb-example.yaml ~/command-history/Ch10
  976  vi nodejs-mongodb-example.yaml 
  977  oc new-app -f ~/todo-app.yaml -p HOSTNAME=y -p BACKEND=z -p PASSWORD=test --dry-run
  978  oc new-app -f ~command-history/Ch10/todo-app.yaml -p HOSTNAME=y -p BACKEND=z -p PASSWORD=test --dry-run
  979  oc new-app -f ~/command-history/Ch10/todo-app.yaml -p HOSTNAME=y -p BACKEND=z -p PASSWORD=test --dry-run
  980  oc new-app -f ~/command-history/Ch10/todoapp.yaml -p HOSTNAME=y -p BACKEND=z -p PASSWORD=test --dry-run
  981  oc 
  982  oc create -f ~/command-history/Ch10/todoapp.yaml 
  983  oc process todoapp --parameters
  984  oc new-project ${RHT_OCP4_DEV_USER}-review-multicontainer
  985  oc new-app review-common/todoapp --dry-run archana-solipuram-ally-com-review-common
  986  oc new-app todoapp --dry-run archana-solipuram-ally-com-review-common
  987  oc new-app todoapp --dry-run 
  988  oc policy add-role-to-group -n ${RHT_OCP4_DEV_USER}-review-common system:image-puller system:serviceaccounts:${RHT_OCP4_DEV_USER}-review-multicontainer
  989  oc new-app ${RHT_OCP4_DEV_USER}-review-common/todoapp -p PASSWORD=redhat -p CLEAN_DATABASE=false -p HOSTNAME=todoui-${RHT_OCP4_DEV_USER}.${RHT_OCP4_WILDCARD_DOMAIN} -p BACKEND=todoapi-${RHT_OCP4_DEV_USER}.${RHT_OCP4_WILDCARD_DOMAIN; }
  990  oc new-app ${RHT_OCP4_DEV_USER}-review-common/todoapp -p PASSWORD=redhat -p CLEAN_DATABASE=false -p HOSTNAME=todoui-${RHT_OCP4_DEV_USER}.${RHT_OCP4_WILDCARD_DOMAIN} -p BACKEND=todoapi-${RHT_OCP4_DEV_USER}.${RHT_OCP4_WILDCARD_DOMAIN}
  991  oc get pods
  992  oc get pods -w
  993  oc get pods 
  994  oc get pods -w
  995  history
  996  history > command-history/Ch10/history
  997  $ mysql -h127.0.0.1 -P30306 -utodoapp -predhat todo < ~/DO288/labs/review-multicontainer/todo.sql
  998  mysql -h127.0.0.1 -P30306 -utodoapp -predhat todo < ~/DO288/labs/review-multicontainer/todo.sql
  999  oc get pods

