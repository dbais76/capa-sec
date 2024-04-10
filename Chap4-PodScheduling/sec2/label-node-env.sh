#!/bin/bash
oc label node worker02 env=dev
oc label node worker03 env=dev
## check if node is labelled
oc get nodes --selector env=dev
