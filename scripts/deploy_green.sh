#!/usr/bin/env bash

## create cluster using eksctl cmd
# Step 1:
# set context
kubectl config use-context arn:aws:eks:us-east-1:243857932979:cluster/udacitycluster
# Step 2:
#  apply controller
kubectl apply -f green_deploy/green-controller.json
# Step 3: 
# apply service
kubectl apply -f green_deploy/green-service.json

kubectl get svc
kubectl get pods
kubectl get nodes