pipeline {
  agent any
  stages {
    stage('lint') {
      steps {
        echo 'Testing'
        sh 'tidy -q -e index.html'
      }
    }

  }
}