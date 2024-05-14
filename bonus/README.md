1) ```sudo ./launch_all.sh```
2) ```./p3/launch_app.sh```
3) ```./install_gitlab.sh```

TO destroy:
 ```./destroy_all.sh```


# https://docs.gitlab.com/ee/tutorials/create_register_first_runner/

```sudo kubectl get svc -n default```

```sudo kubectl get pods```


https://forum.gitlab.com/t/installing-gitlab-on-local-kubernetes-cluster/66935

gitlab-nginx-ingress-controller-6f46d96bb-894fh

```sudo kubectl port-forward service/gitlab-webservice-default 8889:8181 -n gitlab```

```sudo kubectl get secret gitlab-gitlab-initial-root-password -n gitlab -ojsonpath='{.data.password}' | base64 --decode ; echo```




----------------------------

1) Creer un repo gitlab
2) git clone avec http (et le readme) : git clone http://127.0.0.1:8889/root/iot-conf-ndormoy.git
3) mettre les fichiers dans le repo : le dossier dev du github : 
https://github.com/ndormoy/IOT-config-ndormoy

deployment.yaml
ingress.yaml
service.yaml
et application.yaml

4) git add, commit, git push -uf origin main

5) modifier dans confs le application.yaml pou mettre le bon path du repo gitlab (anciennement github)

repoURL: http://gitlab-webservice-default.gitlab.svc:8181/root/iot-conf-ndormoy.git

On voit ici qu'on a mit le webservice qu'on utilise pour gitlab, le namespace, le nom du repo et le port (dans kubernetes)

6) ```sudo kubectl apply -f confs/application.yaml```

7) Puis tester en modifiant 
dans deployment.yaml :
image: wil42/playground:v1

en changeant v1 par v2.

Et tester avant/apres avec
curl http://localhost:8888

On peut aussi montrer le changement avec argoCD