#!/bin/bash

kubectl get cm configmap-web-moon-html -n moon
status=$(k get pods -n moon | grep web-moon | awk 'FNR == 1 {print $3}')
if [ "$status" != "Running" ]; then exit 1; fi

