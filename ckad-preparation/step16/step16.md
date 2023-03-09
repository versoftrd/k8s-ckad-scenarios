El líder tecnol&oacute;gico de Mercury2D decidi&oacute; que es hora de m&acute;s registro, finalmente luchar contra todos estos incidentes de datos faltantes. Hay un contenedor existente llamado "Cleader-Con" en el deployment "cleaner" en el namespace "mercury". Este contenedor monta un volumen y escribe registros en un archivo llamado "cleaner.log".

El YAML para la implementaci&oacute;n existente est&acute; disponible en "/opt/course/cleaner.yaml". Guarda tus cambios en "/opt/course/cleaner-new.yaml", pero tambi&eacute;n aseg&uacute;rese de que la implementaci&oacute;n se est&eacute; ejecutando. Cree un contenedor Sidecar llamado "Logger -Con", Image BusyBox: 1.31.0, que monta el mismo volumen y escribe el contenido de "cleaner.log" al standard output (stdout). Puedes usar el comando Tail -f para esto. De esta manera, puede ser recogido por los registros de kubectl logs.

Compruebe si los registros del nuevo contenedor revelan algo sobre los incidentes de datos faltantes.

> Para saltar la pregunta dar click al siguiente comando y luego presione el botón CHECK:
> `sh /opt/course/skip.sh pregunta16`{{exec}}