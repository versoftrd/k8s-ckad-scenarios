Answer

There are multiple ways to do this, one is to copy an Deployment example from https://kubernetes.io/docs and then merge it with the existing
Pod yaml. That's what we will do now:

```
cp /opt/course/holy-api-pod.yaml /opt/course/9/holy-api-deployment.yaml # make a copy!

vim /opt/course/holy-api-deployment.yaml
```

Now copy/use a Deployment example yaml and put the Pod's metadata: and spec: into the Deployment's template: section:

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

Next create the new Deployment:

` kubectl -f /opt/course/holy-api-deployment.yaml create `

Finally delete the single Pod:

` kubectl -n pluto delete pod holy-api --force --grace-period=0 `

`kubectl -n pluto  get pod deployment |  grep holy `