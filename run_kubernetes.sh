#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="crisroddev/udacity"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run microservices\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=809
    --labels app=microservice

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward microservices 8000:80

# Step 5
# Get LOGS
kubectl logs `kubectl get pods -o=name`

