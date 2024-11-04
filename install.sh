#!/bin/bash
echo "Creating the container of POSTS-APP localy"
docker build -t hugodcs/app-posts:latest .
if [ $? -ne 0 ]; then
    echo "Command failed. Exiting script."
    exit 1
fi

docker push hugodcs/app-posts:latest
if [ $? -ne 0 ]; then
    echo "Push for repository was failed, please make sure you are logged in. Exiting script."
    exit 1
fi
