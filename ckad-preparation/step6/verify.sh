#!/bin/bash

# Namespace a validar
ns="pluto"

# Nombre del pod a validar
deployment="holy-api"

# Ruta del archivo de deployment a validar
deployment_file_path="/opt/course/06/holy-api-deployment.yaml"

# Número de réplicas esperadas
expected_replicas=3

# Obtenemos el número de réplicas del pod
# replica_count=$(kubectl get pod $pod -o jsonpath='{.spec.replicas}')
replica_count=$(kubectl get deployment $deployment -n $ns -o jsonpath='{.spec.replicas}')

# Obtenemos el contexto de seguridad del pod
# security_context=$(kubectl get pod $pod -o jsonpath='{.spec.securityContext.allowPrivilegeEscalation}')
security_context=$(kubectl get deployment $deployment -n $ns -o=jsonpath='{.spec.template.spec.containers[*].securityContext.allowPrivilegeEscalation}')


if [ -f /opt/course/skips/pregunta6.txt ]; then
    echo "Ejecución correcta."
    # Notificar al server resultado
    archivo=$(cat /opt/course/team/equipo.txt)
    json="{\"team\":\"$archivo\", \"question\":6, \"result\":\"skip\"}"
    curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &


else
    if [ "$replica_count" -eq "$expected_replicas" ] && [ "$security_context" = "false" ] ; then
        echo "Ejecución correcta."

        # Notificar al server resultado
        archivo=$(cat /opt/course/team/equipo.txt)
        json="{\"team\":\"$archivo\", \"question\":6, \"result\":\"success\"}"
        curl -X POST -H "Content-Type: application/json" -d "$json" https://api-dev.bhd.com.do/killer-coda/result >/dev/null 2>&1 &

    fi
    echo "Error: validar numero de replicas, contexto de seguridad "
        exit 1

fi