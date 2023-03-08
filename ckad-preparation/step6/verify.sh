#!/bin/bash


if [ -f /opt/course/skips/pregunta6.txt ]; then
    echo "Ejecución correcta."
    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":6, \"result\":\"skip\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
else
    kubectl get pod deployment -n pluto |  grep holy ;
    # sh /opt/course/pod1-status-command.sh;

    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":6, \"result\":\"success\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
fi