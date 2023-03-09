#!/bin/bash
if [ -f /opt/course/skips/pregunta15.txt ]; then
    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":15, \"result\":\"skip\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
else
   kubectl get cm configmap-web-moon-html -n moon
   status=$(kubectl get pods -n moon | grep web-moon | awk 'FNR == 1 {print $3}')
   if [ "$status" != "Running" ]; then exit 1; fi
   
   # Notificar al server resultado
   archivo=$(cat /opt/course/team/equipo.txt)
   json="{\"team\":\"$archivo\", \"question\":15, \"result\":\"success\"}"
   curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
fi

