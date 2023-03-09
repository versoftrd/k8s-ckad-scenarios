Respuesta

Hay varias maneras de hacer esto, uno es copiar un ejemplo de implementación de https://kubernetes.io/docs y luego fusionarlo con el existente
Pod yaml existente. Eso es lo que haremos ahora:

```
cp /opt/course/06/holy-api-pod.yaml /opt/course/06/holy-api-deployment.yaml # make a copy!

vim /opt/course/06/holy-api-deployment.yaml
```

Ahora copie/utilice un Deployment ejemplo yaml y ponga los metadatos del Pod: y spec: en la sección template: del Deployment:

```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: holy-api
  namespace: pluto
spec:
  replicas: 3
  selector:
    matchLabels:
      id: holy-api
  template:
    metadata:
      labels:
        id: holy-api
        name: holy-api
    spec:
      containers:
      - env:
        - name: CACHE_KEY_1
          value: b&MTCi0=[T66RXm!jO@
        - name: CACHE_KEY_2
          value: PCAILGej5Ld@Q%{Q1=#
        - name: CACHE_KEY_3
          value: 2qz-]2OJlWDSTn_;RFQ
        image: nginx:1.17.3-alpine
        name: holy-api-container
        securityContext:
          allowPrivilegeEscalation: false
          privileged: false
        volumeMounts:
        - mountPath: /cache1
          name: cache-volume1
        - mountPath: /cache2
          name: cache-volume2
        - mountPath: /cache3
          name: cache-volume3
      volumes:
      - emptyDir: {}
        name: cache-volume1
      - emptyDir: {}
        name: cache-volume2
      - emptyDir: {}
        name: cache-volume3
```

A continuación, cree el nuevo despliegue:

` kubectl apply -f /opt/course/06/holy-api-deployment.yaml `

Por último, elimine el Pod individual:

` kubectl -n pluto delete pod holy-api --force --grace-period=0 `

`kubectl -n pluto  get pod |  grep holy `