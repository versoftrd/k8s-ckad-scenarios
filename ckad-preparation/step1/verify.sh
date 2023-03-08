#!/bin/sh

if [ -f /opt/course/skips/pregunta1.txt ]; then
    echo "Ejecución correcta."
    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":1, \"result\":\"skip\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &
else
    if [ ! -f /opt/course/1/namespaces.txt ]; then
        echo "Error: no existe el archivo /opt/course/1/namespaces.txt."
        exit 1
    fi
    echo "Ejecución correcta."

    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":1, \"result\":\"success\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &

fi
