#!/bin/bash
kubectl -n moon exec secret-handler -- env | grep SECRET1
kubectl -n moon exec secret-handler -- find /tmp/secret2
kubectl -n moon exec secret-handler -- cat /tmp/secret2/key
# sh /opt/course/2/pod1-status-command.sh;