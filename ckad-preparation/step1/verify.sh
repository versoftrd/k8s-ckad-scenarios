#!/bin/bash

if ./opt/course/2/pod1-status-command.sh | grep -q 'Running'; then
   echo "Success"
fi