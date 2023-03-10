#!/bin/bash

#!/bin/sh

if [ -f /opt/course/skips/pregunta2.txt ]; then
    echo "Ejecución correcta."
    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":2, \"result\":\"skip\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
else

    kubectl describe pod pod1 -n default | grep pod1-container || { echo 'Error'; exit 1; } && \
    kubectl describe pod pod1 -n default | grep httpd:2.4.41-alpine || { echo 'Error'; exit 1; } && \
    sh /opt/course/2/pod1-status-command.sh

    if [ $? -eq 0 ]; then
        echo "Todos los comandos se ejecutaron con éxito"
        exit 0 # código de salida 0 indica éxito
    else
        echo "Al menos un comando falló"
        exit 1 # código de salida diferente de 0 indica fallo
    fi

    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":2, \"result\":\"success\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
fi

