#!/usr/bin/env bash

aws eks --region us-east-1 create-cluster --name demo2 --role-arn arn:aws:iam::243857932979:role/eks --resources-vpc-config subnetIds=subnet-0f54b6ec78504fdf9,subnet-0e17072e9e56ca9b0,subnet-0345fafe1eb799611,securityGroupIds=sg-070d431b9bda386a8
