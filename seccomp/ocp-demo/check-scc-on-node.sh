#!/bin/bash

### Provide the node name as arguement to the shell script, for example master01

oc debug node/$1 -- chroot /host  ls -l /var/lib/kubelet/seccomp
