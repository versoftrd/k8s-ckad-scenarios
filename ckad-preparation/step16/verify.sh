#!/bin/bash

if [ -f /opt/course/skips/pregunta9.txt ]; then
    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":9, \"result\":\"skip\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
else
  if [ ! -f /opt/course/cleaner_new.yaml ]; then
    exit 1
  fi

  pods=$(kubectl get pods -n mercury --no-headers | grep cleaner | awk '{print $1}')

  for pod in $pods
  do
    kubectl -n mercury logs $pod -c logger-con
  done
  
  # Notificar al server resultado
  archivo=$(cat /opt/course/team/equipo.txt)
  json="{\"team\":\"$archivo\", \"question\":9, \"result\":\"success\"}"
  curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
fi
