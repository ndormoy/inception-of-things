#!/bin/sh

# Get Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Install Gitlab Runner

helm repo add gitlab https://charts.gitlab.io
helm init
helm repo update gitlab
helm search repo -l gitlab/gitlab-runner
helm search repo -l gitlab/gitlab-runner
helm install --namespace <NAMESPACE> gitlab-runner -f <CONFIG_VALUES_FILE> gitlab/gitlab-runner
