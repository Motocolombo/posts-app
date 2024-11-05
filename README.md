# POSTS-APP
Software from recive small title and texts from users beond of HTTP POST.
From this project we will use some resourcers where will turn easy deploy, teste and apply.

## Changes:
For this Project have success was necessary change some files and configurations

### FILE ormconfig.env
For have succes to use DNS in Kubernetes, we have to change this ENV, put in the line environment TYPEORM HOST = mariadb-service.

## Script for configure
This script help to generate container, send to repository and execute de manifest of Kubernetes to strat de app.
For this, is necessary have the requirementes:

### Requirement
To this script working fine is necessery have installed:
- Use a linux, based in debian.
- Docker 
```
curl -fsSL https://get.docker.com | bash
```
- [Minikube](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fwindows%2Fx86-64%2Fstable%2F.exe+download) (used in this case for tests)
- Code for execute **minikube nodes** as the same base of tests:
```
minikube start --cni calico --nodes 3
minikube addons enable ingress
```

### Give execution permission to the script
```
chmod +x install.sh
```

### Execute the script
```
./install.sh
```
### After execute
At the end, if all the steps have been finished with success. We will have:

- Kubernetes managing application with DB and APP
- Ingress reciving and mading 


```

```