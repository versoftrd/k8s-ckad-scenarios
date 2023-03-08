#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Error: se debe proporcionar la pregunta (formato pregunta#) como parámetro."
    exit 1
fi

filename=$1
filepath="/opt/course/skips/$filename.txt"

touch "$filepath"

echo "Se ha saltado la $filename. Puedes continuar con las demás. Confíen en ustedes y éxitos!"
