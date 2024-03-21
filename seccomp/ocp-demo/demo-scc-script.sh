#!/bin/bash

oc get scc | grep custom-scc 1> /dev/null
if [ $? -eq 0 ]
  then
    echo "Custom SCC already exists !!"
else
   echo "installing custom SCC now !!"
   oc apply -f custom-scc.yaml
   sleep 5
   oc get scc | grep custom-scc
fi   

oc new-project "demo-scc-$(date +%H%g%M)"
## create a service account to assign anyuid SCC
oc create sa demo-scc

## Bind to SCC ANYUID to allow to run as user root
oc adm policy add-scc-to-user custom-scc -z demo-scc

## deploy the application
oc apply -f demo-scc.yaml
sleep 2
MYPOD=`oc get pod -o jsonpath='{.items[0].metadata.name }'`
echo $MYPOD
## Wait to get pod Ready

oc wait --for=condition=Ready pod/$MYPOD

echo -e "\n\n *** Pod $MYPOD is running !!  ***"
