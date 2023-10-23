#!/bin/sh

check_apply() {
  if kubectl apply -f "$1"; then
    echo "Successfully applied $1"
  else
    echo "Error applying $1"
    exit 1
  fi
}

check_apply "/vagrant/elements/config_map/config_map_app1.yaml"
check_apply "/vagrant/elements/config_map/config_map_app2.yaml"
check_apply "/vagrant/elements/config_map/config_map_app3.yaml"