pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        git(url: 'https://github.com/tiny-fingers/pet-clinic.git', branch: 'main', poll: true)
      }
    }

  }
}