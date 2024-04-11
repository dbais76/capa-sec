#!/bin/bash
cat Dockerfile | oc new-build --dockerfile=- --to=ping
