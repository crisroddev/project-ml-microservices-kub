# Project Microservices 
## Create Virtual Environment
````
python3 -m venv devops
source devops/bin/activate
````

# Docker
````
./run_docker.sh
./make_prediction.sh
./upload_docker.sh
````

# Kubernetes
````
minikube start
kubectl config view
````
# On runb_kubernetes.sh
````
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
````