#!/bin/bash
POD_IP=$(oc get pods mlistener -o jsonpath='{.status.podIP}')
oc exec mlistener -i -t -- socat UDP4-RECVFROM:30102,ip-add-membership=224.1.0.1:$POD_IP,fork EXEC:hostname
