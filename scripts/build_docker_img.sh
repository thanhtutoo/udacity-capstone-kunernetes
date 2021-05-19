#!/usr/bin/env bash

## build docker image

# Step 1:
# Build image 
docker build -t thanhtutoo/capstone my-app/.

# Step 2: 
# List docker images
docker image ls