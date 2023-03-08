> Pods -> deployment

En el Namespace `pluto` hay un Pod llamado `holy-api` . Ha estado funcionando bien durante un tiempo, pero el Equipo Pluto necesita que sea más fiable. Convierte el Pod en un Deployment con 3 réplicas y el nombre holy-api. El archivo de plantilla Pod original está disponible en `/opt/course/06/holy-api-pod.yaml`

Además, el nuevo despliegue debe establecer `allowPrivilegeEscalation: false` para el contexto de seguridad.

Cree el despliegue y guarde su archivo yaml en `/opt/course/06/holy-api-deployment.yaml`.


> Para saltar la pregunta dar click al siguiente comando y luego presione el botón CHECK:
> `sh /opt/course/skip.sh pregunta1`{{exec}}
