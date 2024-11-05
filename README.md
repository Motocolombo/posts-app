# POSTS-APP
Software from recieve small title and texts from users beond of HTTP POST.
From this project we will use some resourcers where will turn easy deploy, teste and apply.

## Changes:
For this Project have success, some files and configurations had to be changed.

### FILE ormconfig.env
For have success to use DNS in Kubernetes, we have to change this ENV, update the line environment TYPEORM HOST = mariadb-service.

## Script for configure
This script helps to generate container, send to repository and execute de manifest of Kubernetes to strat de app.
For this, it is necessary to have the requirements:

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
If all steps are successfully completed. We will have:

- Kubernetes managing application with DB and APP.
- Ingress configured and operational.

## Script for stress test
This **JS** input data into the app, gradually increases traffic to 10 users int frist minute. Then, over nexts 3 minutes, the app stay reciving 50 simultaneos users access, sending PUT requests with data. To conclude the test, betwen the minuts 4 and 5,  the number of acces will reduce to 0.

### Requirement
For execution the test, its necessary install **k6**.

Official site to install [K6](https://grafana.com/docs/k6/latest/set-up/install-k6/)

Linux Debian install:
```
sudo gpg -k
sudo gpg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
sudo apt-get update
sudo apt-get install k6
```