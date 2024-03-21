pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        git(url: 'https://github.com/tiny-fingers/pet-clinic.git', branch: 'main')
      }
    }

    stage('Run mvn package') {
      steps {
        sh 'mvn run package'
      }
    }

  }
}