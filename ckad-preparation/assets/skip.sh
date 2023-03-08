#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Error: se debe proporcionar un nombre de archivo como parámetro."
    exit 1
fi

filename=$1
filepath="/opt/course/skips/$filename.txt"

touch "$filepath"

echo "Archivo $filename.txt creado en la ruta /opt/course/skips/."
