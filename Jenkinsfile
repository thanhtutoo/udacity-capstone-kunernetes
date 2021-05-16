pipeline {
	agent any
	stages {

		stage('Lint HTML') {
			steps {
				sh 'tidy -q -e Deploy-Cluster/index.html'
			}
		}
		
		stage('Build Docker Image') {
			steps {		
                withCredentials([usernamePassword(credentialsId:'dockerid',passwordVariable:'PASSWORD',usernameVariable:'USERNAME')]) {	
					sh '''
						docker build -t aravindb15/capstone Deploy-Cluster/.
					'''
                }
            }
		}

		stage('Push Image To Dockerhub') {
			steps {		
                withCredentials([usernamePassword(credentialsId:'dockerid',passwordVariable:'PASSWORD',usernameVariable:'USERNAME')]) {		
					sh '''
						docker login -u $USERNAME -p $PASSWORD
						docker push thanhtutoo/capstone
					'''				
                }
            }
		}

	}
}