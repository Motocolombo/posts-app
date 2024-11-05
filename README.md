# POSTS-APP
:floppy_disk: Software from recieve small title and texts from users beond of HTTP POST.
From this project we will use some resourcers where will turn easy deploy, teste and apply.

## Changes:
:warning: For this Project have success, some files and configurations had to be changed.

### FILE ormconfig.env
For have success to use DNS in Kubernetes, we have to change this ENV, update the line environment TYPEORM HOST = mariadb-service.

## Script for configure
This script helps to generate container, send to repository and execute de manifest of Kubernetes to strat de app.
For this, it is necessary to have the requirements:

### Requirement
:compass: To this script working fine is necessery have installed:

:pushpin: Use a linux, based in debian.

:pushpin: Install [Docker](https://docs.docker.com/engine/install/).

:pushpin: Install [Minikube](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fwindows%2Fx86-64%2Fstable%2F.exe+download) (used in this case for tests).

:pushpin: Code for execute **minikube nodes** as the same base of tests:
```
minikube start --cni calico --nodes 2
minikube addons enable ingress
minikube tunnel
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
:roller_coaster: If all steps are successfully completed. We will have:

:white_check_mark: Kubernetes managing application with DB and APP.

:white_check_mark: Ingress configured and operational.

## Script for stress test
:rocket: This **JS** input data into the app, gradually increases traffic to 10 users int frist minute. Then, over nexts 3 minutes, the app stay reciving 50 simultaneos users access, sending PUT requests with data. To conclude the test, betwen the minuts 4 and 5,  the number of acces will reduce to 0.

### Requirement
For execution the test, its necessary install **k6**.

:pushpin: Official site to install [K6](https://grafana.com/docs/k6/latest/set-up/install-k6/).

## Executing script test :chart_with_downwards_trend:
```
k6 run script_teste.js
```
