#!/bin/bash

# Crear foldes o archivos
mkdir -p /opt/course/team/
mkdir -p /opt/course/skips/
mkdir -p /opt/course/06/
mkdir -p /opt/course/07/

# Crear namespaces
kubectl create namespace mbp
kubectl create namespace mbp-utils
kubectl create namespace mbe
kubectl create namespace mbe-utils
kubectl create namespace pluto-main
kubectl create namespace pluto-1
kubectl create namespace pluto
kubectl create namespace earth
kubectl create namespace jupiter
kubectl create namespace mars
kubectl create namespace mercury
kubectl create namespace moon
kubectl create namespace neptune
kubectl create namespace saturn
kubectl create namespace sun
kubectl create namespace venus


