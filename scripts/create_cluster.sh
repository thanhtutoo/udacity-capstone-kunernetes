#!/usr/bin/env bash

## create cluster using eksctl cmd

# Step 1:
# Build image and add a descriptive tag
eksctl create cluster --name udacitycluster --nodegroup-name standard-workers --node-type t2.small --nodes 2 --nodes-min 1 --nodes-max 3 --node-ami auto --region us-east-1
# Step 2: 
# update kubeconfig
aws eks --region us-east-1 update-kubeconfig --name udacitycluster