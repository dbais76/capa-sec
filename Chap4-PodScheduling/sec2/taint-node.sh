#!/bin/bash
oc adm taint node worker03 data=secret-load:NoSchedule
## check if node is tainted
oc describe node worker03 | grep Taints
