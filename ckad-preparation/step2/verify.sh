#!/bin/bash

#!/bin/sh

if [ -f /opt/course/skips/pregunta2.txt ]; then
    echo "Ejecución correcta."
    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":2, \"result\":\"skip\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
else
    kubectl describe pod pod1 -n default | grep pod1-container;
    sh /opt/course/2/pod1-status-command.sh;

    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":2, \"result\":\"success\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
fi

