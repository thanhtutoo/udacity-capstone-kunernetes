# udacity-capstone-kunernetes
## This project covers

* Working in AWS
* Using Jenkins to implement Continuous Integration and Continuous Deployment
* Building pipelines
* Working CloudFormation to deploy clusters
* Building Kubernetes clusters
* Building Docker containers in pipelines

### Requirements to install
* install Java
* Install Jenkins
* Configure Jenkins with AWS Credential and docker Credential
* Install BlueOcean Plugin
* Install Docker
* Install AWS CLI
* Install and Set Up kubectl

## steps to set up (1st method)
1. ./scripts/create_cluster.sh
2. ./scripts/build_docker_img.sh
3. ./scripts/upload_docker.sh
4. ./scripts/deploy_blue.sh
5. ./scripts/deploy_green.sh

## steps to set up (2nd method)
1. use cloudformation/eks-vpc.yaml to create eks vpc from aws console
2. ./scripts/create-eks.sh
3. use cloudformation/eks-nodegroup.yaml to create nodegroup worker from aws console
4. aws eks --region us-east-1 update-kubeconfig --name demo4
5. kubectl apply -f cloudformation/aws-auth-cm.yaml
6. kubectl get nodes
7. ./scripts/build_docker_img.sh
8. ./scripts/upload_docker.sh
9. ./scripts/deploy_blue.sh
10. ./scripts/deploy_green.sh

# reference
https://logz.io/blog/amazon-eks-cluster/
