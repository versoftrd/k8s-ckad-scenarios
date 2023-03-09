Answer

```
kubectl -n moon get pod # show pods
kubectl -n moon create secret -h # help
kubectl -n moon create secret generic -h # help
kubectl -n moon create secret generic secret1 --from-literal user=test --from-literal pass=pwd

```

El último comando generaría este yaml:

```yaml
apiVersion: v1 
kind: Secret 
metadata:
  creationTimestamp: null 
  name: secret1 
  namespace: moon
data:
  pass: cHdk 
  user: dGVzdA==

```

A continuación creamos el segundo Secret desde la ubicación dada, asegurándonos de que se creará en el Namespace `moon

` kubectl apply -n moon -f /opt/course/07/secret2.yaml create`

Ahora editaremos el Pod yaml

```
cp /opt/course/07/secret-handler.yaml /opt/course/07/secret-handler-new.yaml
vim /opt/course/07secret-handler-new.yaml
```

Añade lo siguiente al yaml:

```yaml

apiVersion: v1 
kind: Pod 
metadata:
  labels: 
    id: secret-handler
    uuid: 1428721e-8d1c-4c09-b5d6-afd79200c56a 
    red_ident: 9cf7a7c0-fdb2-4c35-9c13-c2a0bb52b4a9 
    type: automatic
  name: secret-handler
  namespace: moon 
spec:
  volumes:
  - name: cache-volume1
    emptyDir: {}
  - name: cache-volume2
    emptyDir: {}
  - name: cache-volume3
    emptyDir: {}
  - name: secret2-volume
    secret:
      secretName: secret2
  containers:
  - name: secret-handler
    image: bash:5.0.11
    args: ['bash', '-c', 'sleep 2d'] 
    volumeMounts:
    - mountPath: /cache1
      name: cache-volume1
    - mountPath: /cache2
      name: cache-volume2
    - mountPath: /cache3
      name: cache-volume3
    - name: secret2-volume
      mountPath: /tmp/secret2
    env:
    - name: SECRET_KEY_1
      value: ">8$kH#kj..i8}HImQd{"
    - name: SECRET_KEY_2
      value: "IO=a4L/XkRdvN8jM=Y+"
    - name: SECRET_KEY_3
      value: "-7PA0_Z]>{pwa43r)__"
    - name: SECRET1_USER 
      valueFrom:
        secretKeyRef:
          name: secret1 
          key: user
    - name: SECRET1_PASS 
      valueFrom:
        secretKeyRef:
          name: secret1 
          key: pass
```


También existe la posibilidad de importar todas las claves de un Secreto como variables env a la vez, aunque los nombres de las variables env serán entonces los mismos que en el Secreto, lo que no funciona para los requisitos aquí planteados:

```yaml
    containers:
    - name: secret-handler 
...
    envFrom:
    - secretRef:
        name: secret1
```

A continuación, aplicamos los cambios:
```
kubectl delete pod secret-handler -n moon --force --grace-period=0
kubectl apply -f /opt/course/07/secret-handler-new.yaml
```
