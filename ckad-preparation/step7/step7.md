> Secret, Secret-Volume, Secret-Env

Necesitas hacer cambios en un Pod existente en el Namespace `moon` llamado `secret-handler`. Crea un nuevo Secret `secret1` que contenga `user=test` y `pass=pwd` . El contenido del Secret debe estar disponible en el Pod `secret-handlers` como variables de entorno `SECRET1_USER` y
`SECRET1_PASS` . El yaml para Pod está disponible en `/opt/course/07/secret-handler.yaml` .

Existe yaml para otro Secret en `/opt/course/07/secret2.yaml` , cree este Secret y móntelo dentro del mismo Pod en `tmp/secret2` . Los cambios se guardarán en `/opt/course/07/secret-handler-new.yaml` . Ambos Secrets sólo deberían estar disponibles en espacio de nombres `moon` .

> Para saltar la pregunta dar click al siguiente comando y luego presione el botón CHECK:
> `sh /opt/course/skip.sh pregunta7`{{exec}}
