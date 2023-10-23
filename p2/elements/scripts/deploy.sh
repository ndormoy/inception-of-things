#!/bin/sh

kubectl apply -f "/vagrant/elements/config_map/config_map_app1.yaml"
sleep 5
kubectl apply -f "/vagrant/elements/config_map/config_map_app2.yaml"
sleep 5
kubectl apply -f "/vagrant/elements/config_map/config_map_app3.yaml"
sleep 5
kubectl apply -f "/vagrant/elements/services/service_app1.yaml"
sleep 5
kubectl apply -f "/vagrant/elements/services/service_app2.yaml"
sleep 5
kubectl apply -f "/vagrant/elements/services/service_app3.yaml"
sleep 5
kubectl apply -f "/vagrant/elements/deployments/deploy_app1.yaml"
sleep 5
kubectl apply -f "/vagrant/elements/deployments/deploy_app2.yaml"
sleep 5
kubectl apply -f "/vagrant/elements/deployments/deploy_app3.yaml"
sleep 5
kubectl apply -f "/vagrant/elements/ingress/ingress_app1.yaml"
sleep 5
kubectl apply -f "/vagrant/elements/ingress/ingress_app2.yaml"
sleep 5
kubectl apply -f "/vagrant/elements/ingress/ingress_app3.yaml"
sleep 5


