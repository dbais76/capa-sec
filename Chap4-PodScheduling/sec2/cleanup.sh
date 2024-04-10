#!/bin/bash
if [ $1 = "env" ];
  then
    echo "Reverting node labels !!    "
    oc label node worker02 env-
    oc label node worker03 env-
else
   echo "untainting nodes now !!"
   oc adm taint node worker03 data=secret-load:NoSchedule-
   sleep 5
   oc describe node worker03 | grep Taints
fi
