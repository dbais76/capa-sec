#!/bin/bash
CIDR=$(oc get Network.config.openshift.io cluster -o jsonpath='{.status.clusterNetwork[0].cidr}')
oc exec msender -it -- /bin/bash -c "echo | socat STDIO UDP4-DATAGRAM:224.1.0.1:30102,range=$CIDR,ip-multicast-ttl=64"
