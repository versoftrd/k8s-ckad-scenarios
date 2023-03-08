#!/bin/bash



if [ -f /opt/course/skips/pregunta7.txt ]; then
    echo "Ejecución correcta."
    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":7, \"result\":\"skip\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
else
    kubectl -n moon exec secret-handler -- env | grep SECRET1
    kubectl -n moon exec secret-handler -- find /tmp/secret2
    kubectl -n moon exec secret-handler -- cat /tmp/secret2/key
    # sh /opt/course/2/pod1-status-command.sh;

    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":7, \"result\":\"success\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
fi