#!/bin/sh

. /vagrant/scripts/config_map.sh

pod_count=5  # Number of pods you want to check
check_pod_started() {

  while true; do
        pods_number=$(kubectl get pods --no-headers -o custom-columns=":.metadata.name" | wc -l)
        
        if [ "$pods_number" -eq "$pod_count" ]; then
            pods_name=$(kubectl get pods --no-headers -o custom-columns=":.metadata.name")
            echo "All pods started : $pods_name"
            for pod_name in $pods_name; do
                echo "checking pod name = $pod_name is running"
                check_pod_running "$pod_name"
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

check_apply "/vagrant/confs/deployments/deploy_app1.yaml"
check_apply "/vagrant/confs/deployments/deploy_app2.yaml"
check_apply "/vagrant/confs/deployments/deploy_app3.yaml"

check_pod_started