pipeline {
  agent any
  stages {
    stage('Lint HTML') {
      steps {
        sh 'tidy -q -e index.html'
      }
    }
 	stage('Initialize docker'){
        def dockerHome = tool 'mydocker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
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