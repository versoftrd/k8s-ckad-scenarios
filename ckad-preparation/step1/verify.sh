#!/bin/sh

if [ -f /opt/course/skips/pregunta1.txt ]; then
    echo "Ejecución correcta."
else
    if [ ! -f /opt/course/1/namespaces.txt ]; then
        echo "Error: no existe el archivo /opt/course/1/namespaces.txt."
        exit 1
    fi
    echo "Ejecución correcta."
fi
