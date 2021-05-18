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
  }
}