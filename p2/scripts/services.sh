#!/bin/sh

. /vagrant/scripts/config_map.sh

# Function to check if a service is running (or exists)
check_service() {
  service_name="$1"
  
  while ! kubectl get service "$service_name" > /dev/null 2>&1; do
    echo "Service $service_name is not running or doesn't exist. Waiting..."
    sleep 5  # Adjust the sleep duration as needed
  done
  
  echo "Service $service_name is running (or now exists)"
}

check_apply "/vagrant/confs/services/service_app1.yaml"
check_apply "/vagrant/confs/services/service_app2.yaml"
check_apply "/vagrant/confs/services/service_app3.yaml"

check_service "app1-service"
check_service "app2-service"
check_service "app3-service"