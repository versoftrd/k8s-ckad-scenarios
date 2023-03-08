#!/bin/sh

if [ ! -e /opt/course/team/equipo.txt ]; then
    echo "Error: el archivo no existe."
    exit 1
fi