#!/bin/sh

kubectl apply -f "/vagrant/elements/config_map/config_map_app1.yaml"
sleep 5
kubectl apply -f "/vagrant/elements/config_map/config_map_app2.yaml"
sleep 5
kubectl apply -f "/vagrant/elements/services/service_app1.yaml"
sleep 5
kubectl apply -f "/vagrant/elements/services/service_app2.yaml"
sleep 5
kubectl apply -f "/vagrant/elements/deployments/deploy_app1.yaml"
sleep 5
kubectl apply -f "/vagrant/elements/deployments/deploy_app2.yaml"
sleep 5
kubectl apply -f "/vagrant/elements/ingress/ingress_app1.yaml"
sleep 5
kubectl apply -f "/vagrant/elements/ingress/ingress_app2.yaml"
sleep 5

# kubectl apply -f "/vagrant/elements/test2.yaml"
# sleep 3
# kubectl apply -f "/vagrant/elements/ingress_app1.yaml"


