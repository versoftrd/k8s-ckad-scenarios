#!/bin/bash

# Namespace a validar
ns="moon"

if [ -f /opt/course/skips/pregunta7.txt ]; then
    echo "Ejecución correcta."
    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":7, \"result\":\"skip\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
else
    if [! kubectl get secret "secret1" -n "$ns" >/dev/null 2>&1 ] && [! kubectl get secret "secret2" -n "$ns" >/dev/null 2>&1 ]; then
    echo "El secreto no existe en el namespace $ns"
    exit 1

    fi

    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":7, \"result\":\"success\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
fi