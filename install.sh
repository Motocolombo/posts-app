#!/bin/bash
echo "Creating the container of POSTS-APP localy"
docker build -t hugodcs/app-posts:latest .
if [ $? -ne 0 ]; then
    echo "Command failed. Exiting script."
    exit 1
fi
echo "Sending container to repository"
docker push hugodcs/app-posts:latest
if [ $? -ne 0 ]; then
    echo "Push for repository was failed, please make sure you are logged in. Exiting script."
    exit 1
fi

echo "Appling manifests kubernetes localy"
kubectl apply -f ./kubernetes/maria_db-deployment.yml
kubectl apply -f ./kubernetes/maria_db-service.yml
kubectl apply -f ./kubernetes/posts-deployment.yml
kubectl apply -f ./kubernetes/posts-service.yml
kubectl apply -f ./kubernetes/posts-ingress.yml