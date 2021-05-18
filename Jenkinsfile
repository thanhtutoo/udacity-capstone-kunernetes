pipeline {
  agent any
  stages {
    stage('Lint HTML') {
      steps {
        sh 'tidy -q -e index.html'
      }
    }

    stage('Build Docker Image ') {
      steps {
        withCredentials(bindings: [usernamePassword(credentialsId:'dockerid',passwordVariable:'PASSWORD',usernameVariable:'USERNAME')]) {
          sh '''
						docker build -t thanhtutooai/capstone .
					'''
        }

      }
    }

    stage('Push Image To Dockerhub') {
      steps {
        withCredentials(bindings: [usernamePassword(credentialsId:'dockerid',passwordVariable:'PASSWORD',usernameVariable:'USERNAME')]) {
          sh '''
						docker login -u $USERNAME -p $PASSWORD
						docker push thanhtutooai/capstone
					'''
        }

      }
    }

		stage('test aws') {
			steps {
				withAWS(region:'us-east-1', credentials:'awsid') {
					sh '''
						aws s3 ls
					'''
				}
			}
		}
    stage('update config kubectl context') {
			steps {
				withAWS(region:'us-east-1', credentials:'awsid') {
					sh '''
						aws eks --region us-east-1 update-kubeconfig --name udacitycluster
					'''
				}
			}
		} 
    stage('Set current kubectl context') {
			steps {
				withAWS(region:'us-east-1', credentials:'awsid') {
					sh '''
						kubectl config use-context arn:aws:eks:us-east-1:243857932979:cluster/udacitycluster
					'''
				}
			}
		}

		stage('Deploy blue container') {
			steps {
					withAWS(region:'us-east-1', credentials:'awsid') {
					sh '''
						kubectl apply -f blue_deploy/blue-controller.json
					'''
				}
			}
		}

		stage('Deploy green container') {
			steps {
								withAWS(region:'us-east-1', credentials:'awsid') {

					sh '''
						kubectl apply -f green_deploy/green-controller.json
					'''
				}
			}
		}

		stage('Create the service in the cluster, redirect to blue') {
			steps {
								withAWS(region:'us-east-1', credentials:'awsid') {

					sh '''
						kubectl apply -f blue_deploy/blue-service.json
					'''
				}
			}
		}

		stage('Wait user approve') {
            steps {
                input "Ready to redirect traffic to green?"
            }
        }

		stage('Create the service in the cluster, redirect to green') {
			steps {
								withAWS(region:'us-east-1', credentials:'awsid') {

					sh '''
						kubectl apply -f green_deploy/green-service.json
					'''
				}
			}
		}
  }
}