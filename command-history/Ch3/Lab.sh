
   22  lab expose-image start
   23  oc project ${RHT_OCP4_DEV_USER}-common
   26  oc get is
   30  sudo podman login quay.io
   31  sudo skopeo copy oci:~/DO288/labs/expose-image/php-info quay.io/asolipu
   32  sudo skopeo copy oci:/home/student/DO288/labs/expose-image/php-info quay.io/asolipu/php-info
   33  sudo skopeo copy oci:/home/student/DO288/labs/expose-image/php-info docker://quay.io/asolipu/php-info
skopeo inspect docker://quay.io/${RHT_OCP4_QUAY_USER}/php-info
   34  oc get is
   35  podman login -u asolipu  quay.io
   36  oc create secret generic quayio --from-file .dockerconfigjson=${XDG_RUNTIME_DIR}/containers/auth.json --type kubernetes.io/dockerconfigjson
   37  oc secrets link default quayio
   38  oc  import-image php-info --confirm --from quay.io --reference-policy local 
   39  oc  import-image php-info --confirm --from quay.io/asolipu/php-info:latest --reference-policy local 
   40  oc get istag
   41  oc get is
   42  oc  delete is php-info
   43  oc  import-image php-info --confirm --from quay.io/asolipu/php-info:latest --reference-policy local 
  
 oc new-project ${RHT_OCP4_DEV_USER}-expose-image
 oc  policy -n ${RHT_OCP4_DEV_USER}-common add-role-to-group system:image-puller system.serviceaccounts.${RHT_OCP4_DEV_USER}-expose-imageoc  policy -n ${RHT_OCP4_DEV_USER}-common add-role-to-group system:image-puller system.serviceaccounts.${RHT_OCP4_DEV_USER}-expose-image
   45  oc  policy -n ${RHT_OCP4_DEV_USER}-common add-role-to-group system:image-builder system.serviceaccounts.${RHT_OCP4_DEV_USER}-expose-image
   46  oc new-project ${RHT_OCP4_DEV_USER}-expose-image
   47  oc new-app --name info -i ${RHT_OCP4_DEV_USER}-common/php-info --dry-run
   48  oc new-app --name info -i ${RHT_OCP4_DEV_USER}-common/php-info
   49  oc expose svc/info
   50  oc get pods
   51  oc get pods -w
   52  oc logs info-1-scvfw
   53  history
   54  oc project
   55  podman login -u asolipu quay.io
   56  oc create secret generic quayio --from-file .dockerconfigjson=${XDG_RUNTIME_DIR}/container/auth.json --type kubernetes.io/dockerconfigjson --for pull
   57  oc create secret generic quayio --from-file .dockerconfigjson=${XDG_RUNTIME_DIR}/container/auth.json --type kubernetes.io/dockerconfigjson
   58  oc create secret generic quayio --from-file .dockerconfigjson=${XDG_RUNTIME_DIR}/containers/auth.json --type kubernetes.io/dockerconfigjson
   59  oc secrets link builder quayio --for pull
   60  oc get all -l app=name
   61* oc get pods -
   62  oc get all -l app=info
   63  oc delete all -l app=info
   64  history
   65  oc project
   66  oc adm policy -n ${RHT_OCP4_DEV_USER}-common add-role-to-group system:image-puller system.serviceaccounts.${RHT_OCP4_DEV_USER}-expose-image
   67  oc  policy -n ${RHT_OCP4_DEV_USER}-common add-role-to-group system:image-builder system.serviceaccounts.${RHT_OCP4_DEV_USER}-expose-image
   68  oc  policy -n ${RHT_OCP4_DEV_USER}-common add-role-to-group system:image-puller system.serviceaccounts.${RHT_OCP4_DEV_USER}-expose-image
   69  oc new-app --name info -i ${RHT_OCP4_DEV_USER}-common/php-info
   70  oc get all -l app=info
   71  oc delete all -l app=info
   72  oc get istag
   73  oc new-app --name info -i ${RHT_OCP4_DEV_USER}-common/php-info
   74  oc get dc
   75  history
   76  oc delete all -l app=info
   77  oc get istag
   78  oc get istag -n openshift
   79  oc get dc
   80  oc get is
   81  oc get all -l app=info
   82  oc delete is info
   83  history
   84  oc new-app --name info -i ${RHT_OCP4_DEV_USER}-common/php-info
   85  oc get pods
   86  oc logs -f info-1-7hx5c
   87  history > ~/command-history/Ch3/Lab.sh
