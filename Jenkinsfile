pipeline {
  agent any
  stages {
    stage('Lint HTML') {
      steps {
        sh 'tidy -q -e index.html'
        sh 'def dockerHome = tool \'mydocker\''
      }
    }

    stage('Build Docker Image ') {
      steps {
        withCredentials(bindings: [usernamePassword(credentialsId:'dockerid',passwordVariable:'PASSWORD',usernameVariable:'USERNAME')]) {
          sh '''
						docker build -t thanhtutoo/capstone .
					'''
        }

      }
    }

    stage('Push Image To Dockerhub') {
      steps {
        withCredentials(bindings: [usernamePassword(credentialsId:'dockerid',passwordVariable:'PASSWORD',usernameVariable:'USERNAME')]) {
          sh '''
						docker login -u $USERNAME -p $PASSWORD
						docker push thanhtutoo/capstone
					'''
        }

      }
    }

  }
}