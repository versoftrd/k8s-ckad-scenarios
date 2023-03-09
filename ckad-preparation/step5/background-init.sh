# Crear folders o archivos
mkdir -p /opt/course/5

# Ejecutar scripts iniciales
kubectl apply -f api-new-c32.yaml
kubectl apply -f api-new-c32-error.yaml
kubectl apply -f api-new-c32-error.yaml