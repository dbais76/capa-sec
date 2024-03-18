#!/bin/bash

oc new-project "demo-$(date +%H%g%M)"
## create a service account to assign anyuid SCC
oc create sa demo-dep

## Bind to SCC ANYUID to allow to run as user root
oc adm policy add-scc-to-user anyuid -z demo-dep

## deploy the application
oc apply -f demo-dep.yaml
sleep 2
MYPOD=`oc get pod -o jsonpath='{.items[0].metadata.name }'`
echo $MYPOD
## Wait to get pod Ready

oc wait --for=condition=Ready pod/$MYPOD

echo -e "\n\n *** Pod $MYPOD is running !!  ***"
