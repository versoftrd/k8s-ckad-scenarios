Answer

```
k -n moon get pod # show pods
k -n moon create secret -h # help
k -n moon create secret generic -h # help
k -n moon create secret generic secret1 --from-literal user=test --from-literal pass=pwd

```

The last command would generate this yaml:

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

Next we create the second Secret from the given location, making sure it'll be created in Namespace `moon`

` kubectl -n moon -f /opt/course/secret2.yaml create`

We will now edit the Pod yaml

```
cp /opt/course/secret-handler.yaml /opt/course/secret-handler-new.yaml
vim /opt/course/secret-handler-new.yaml
```

Add the following to the yaml:

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


There is also the possibility to import all keys from a Secret as env variables at once, though the env variable names will then be the same as in the Secret, which doesn't work for the requirements here:

```yaml
    containers:
    - name: secret-handler 
...
    envFrom:
    - secretRef:
        name: secret1
```

Then we apply the changes:
```
k -f /opt/course/secret-handler.yaml delete --force --grace-period=0
k -f /opt/course/secret-handler-new.yaml create
```

Instead of running delete and create we can also use recreate:

`k -f /opt/course/14/secret-handler-new.yaml replace --force --grace-period=0`

It was not requested directly, but you should always confirm it's working:


`k -n moon exec secret-handler -- env | grep SECRET1 `

`k -n moon exec secret-handler -- find /tmp/secret2`

`k -n moon exec secret-handler -- cat /tmp/secret2/key `