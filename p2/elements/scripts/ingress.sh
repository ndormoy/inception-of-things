#!/bin/sh

. /vagrant/elements/scripts/config_map.sh

check_ingress()
{
    ingress_name="$1"
    while true; do
        ingress_status=$(kubectl get ingress "$ingress_name" --no-headers -o custom-columns=":.status.loadBalancer.ingress")
        if [ "$ingress_status" != "<none>" ]; then
            echo "Ingress $ingress_name is running"
            break  # Exit the loop when the pod is running
        else
            echo "Ingress $ingress_name is not running. Waiting..."
            sleep 3  # Adjust the sleep duration as needed
        fi
    done
}

check_apply "/vagrant/elements/ingress/ingress_app1.yaml"
check_ingress "app1-ingress"
check_apply "/vagrant/elements/ingress/ingress_app2.yaml"
check_ingress "app2-ingress"
check_apply "/vagrant/elements/ingress/ingress_app3.yaml"
check_ingress "app3-ingress"
check_ingress "default-ingress"