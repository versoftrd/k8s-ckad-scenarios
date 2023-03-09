#!/bin/bash

if [ -f /opt/course/skips/pregunta10.txt ]; then
    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":10, \"result\":\"skip\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
else
  podname=$(kubectl get pods -n mars | grep test-init-container | awk '{print $1}')
    
  initname=$(kubectl get pod $podname -o jsonpath='{.spec.initContainers[0].name}' -n mars)
  podip=$(kubectl get pod $podname -o jsonpath='{.status.podIP}' -n mars)
    
  if [ $initname != 'init-con' ]; then
    exit 1
  fi
    
  out=$(curl -s $podip)
    
  if [ "$out" != 'check this out!' ]; then
    exit 1
  fi
  
  # Notificar al server resultado
  archivo=$(cat /opt/course/team/equipo.txt)
  json="{\"team\":\"$archivo\", \"question\":10, \"result\":\"success\"}"
  curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
fi
