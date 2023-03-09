#!/bin/bash
echo 'se ejecuto el script'
if [ -f /opt/course/skips/pregunta16.txt ]; then
    echo 'La pregunta fue skipeada'
    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":16, \"result\":\"skip\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
else
  echo 'No hay skip de la pregunta'
  if [ ! -f /opt/course/cleaner_new.yaml ]; then
    exit 1
  fi

  pods=$(kubectl get pods -n mercury --no-headers | grep cleaner | awk '{print $1}')
  echo 'Paso 1'

  for pod in $pods
  do
    kubectl -n mercury logs $pod -c logger-con)
    echo 'Paso 2'
  done
  echo 'Paso 3'
  
  # Notificar al server resultado
  archivo=$(cat /opt/course/team/equipo.txt)
  json="{\"team\":\"$archivo\", \"question\":16, \"result\":\"success\"}"
  curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
  echo 'Paso 4'
fi
