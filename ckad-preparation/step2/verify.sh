#!/bin/bash

kubectl describe pod pod1 -n default | grep pod1-container;
sh /opt/course/2/pod1-status-command.sh;