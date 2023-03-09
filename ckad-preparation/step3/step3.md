Crea un único Pod llamado `pod6` en el Namespace `default` con la imagen `busybox:1.31.0`. El Pod debe tener una probe de preparación que ejecute `cat /tmp/ready`. Debe esperar inicialmente 5 segundos y luego esperar periódicamente 10 segundos. Esto establecerá que el contenedor está listo solo si el archivo `/tmp/ready` existe.

El Pod debe ejecutar el comando `touch /tmp/ready && sleep 1d`, lo que creará el archivo necesario para que esté listo y luego se mantendrá en espera. Crea el Pod y confirma que se inicia correctamente.

> Para saltar la pregunta dar click al siguiente comando y luego presione el botón CHECK:
> `sh /opt/course/skip.sh pregunta3`{{exec}}
