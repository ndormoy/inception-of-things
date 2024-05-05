1) ```sudo ./launch_all.sh```
2) ```./p3/launch_app.sh```
3) ```./install_gitlab.sh```

TO destroy:
 ```./destroy_all.sh```


# https://docs.gitlab.com/ee/tutorials/create_register_first_runner/

sudo kubectl get svc -n default
sudo kubectl get pods
sudo kubectl port-forward gitlab-nginx-ingress-controller-6f46d96bb-kds97 1080:443

https://forum.gitlab.com/t/installing-gitlab-on-local-kubernetes-cluster/66935

gitlab-nginx-ingress-controller-6f46d96bb-894fh

sudo kubectl port-forward service/gitlab-webservice-default 8888:8181 -n gitlab