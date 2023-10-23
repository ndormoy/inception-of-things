#!/bin/sh

check_apply() {
  if kubectl apply -f "$1"; then
    echo "Successfully applied $1"
  else
    echo "Error applying $1"
    exit 1
  fi
}

# Function to check if a service is running (or exists)
check_service() {
  service_name="$1"
  
  while ! kubectl get service "$service_name" > /dev/null 2>&1; do
    echo "Service $service_name is not running or doesn't exist. Waiting..."
    sleep 5  # Adjust the sleep duration as needed
  done
  
  echo "Service $service_name is running (or now exists)"
}



pod_count=5  # Number of pods you want to check
check_pod_started() {

  while true; do
        pods_number=$(kubectl get pods --no-headers -o custom-columns=":.metadata.name" | wc -l)
        
        if [ "$pods_number" -eq "$pod_count" ]; then
            pods_name=$(kubectl get pods --no-headers -o custom-columns=":.metadata.name")
            # all_pods=$(kubectl get pods --field-selector=status.phase=Running --no-headers -o custom-columns=":.metadata.name" | wc -l)
            echo "All pods started : $pods_name"
            for pod_name in $pods_name; do
                echo "pod name = $pod_name"
                check_pod_running "$pod_name"
                echo "pouet"
            done
            break
        fi

        echo "Not all specified pods are running. Waiting..."
        sleep 3  # Adjust the sleep duration as needed
    done
  

}

# Function to check if a pod is running
check_pod_running() {
  pod_name="$1"
  
  while true; do
    pod_status=$(kubectl get pod "$pod_name" --no-headers -o custom-columns=":.status.phase")
    if [ "$pod_status" = "Running" ]; then
      echo "Pod $pod_name is running"
      break  # Exit the loop when the pod is running
    elif [ "$pod_status" = "CrashLoopBackOff" ]; then
        echo "Pod $pod_name is in CrashLoopBackOff state. Exiting..."
        exit 1
    elif [ "$pod_status" = "Error" ]; then
        echo "Pod $pod_name is in Error state. Exiting..."
        exit 1
    else
      echo "Pod $pod_name is not running. Waiting..."
      sleep 3  # Adjust the sleep duration as needed
    fi
  done
}


# Wait until all specified pods are running


check_apply "/vagrant/elements/config_map/config_map_app1.yaml"
check_apply "/vagrant/elements/config_map/config_map_app2.yaml"
check_apply "/vagrant/elements/config_map/config_map_app3.yaml"

check_apply "/vagrant/elements/services/service_app1.yaml"
check_apply "/vagrant/elements/services/service_app2.yaml"
check_apply "/vagrant/elements/services/service_app3.yaml"
check_service "app1-service"
check_service "app2-service"
check_service "app3-service"


check_apply "/vagrant/elements/deployments/deploy_app1.yaml"
check_apply "/vagrant/elements/deployments/deploy_app2.yaml"
check_apply "/vagrant/elements/deployments/deploy_app3.yaml"
# Get the names of all running pods
# running_pods=$(kubectl get pods --field-selector=status.phase=Running --no-headers -o custom-columns=":.metadata.name")
# all_pods=$(kubectl get pods --no-headers -o custom-columns=":.metadata.name")
# echo "Running pods: $all_pods"

# # Check the status of each running pod
# for pod_name in $all_pods; do
#   check_pod_running "$pod_name"
#   echo "pouet"
# done
check_pod_started

check_apply "/vagrant/elements/ingress/ingress_app1.yaml"
sleep 5
check_apply "/vagrant/elements/ingress/ingress_app2.yaml"
sleep 5
check_apply "/vagrant/elements/ingress/ingress_app3.yaml"
sleep 5


