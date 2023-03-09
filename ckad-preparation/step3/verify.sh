#!/bin/bash

#!/bin/sh

if [ -f /opt/course/skips/pregunta2.txt ]; then
    echo "Ejecución correcta."
    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":2, \"result\":\"skip\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
else

    kubectl get pod pod6 -n default | grep Running || { echo 'Error'; exit 1; } && \
    kubectl describe pod pod6 -n default | grep busybox:1.31.0 || { echo 'Error'; exit 1; } && \

    if [ $? -eq 0 ]; then
        echo "Todos los comandos se ejecutaron con éxito"
        exit 0 # código de salida 0 indica éxito
        
        # Notificar al server resultado
        archivo=$(cat /opt/course/team/equipo.txt)
        json="{\"team\":\"$archivo\", \"question\":2, \"result\":\"success\"}"
        curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
    else
        echo "Al menos un comando falló"
        exit 1 # código de salida diferente de 0 indica fallo
    fi
fi

