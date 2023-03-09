#!/bin/bash

if [ -f /opt/course/skips/pregunta4.txt ]; then
    echo "Ejecución correcta."
    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":4, \"result\":\"skip\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
else
    if kubectl get pod -n neptune --selector app=my-happy-shop >/dev/null 2>&1; then    
        echo "Ejecución correcta."
        # Notificar al server resultado
        archivo=$(cat /opt/course/team/equipo.txt)
        json="{\"team\":\"$archivo\", \"question\":4, \"result\":\"success\"}"
        curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
    else
        echo "Error: no existe el pod en el namespace indicado."
        exit 1
    fi
fi