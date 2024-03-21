pipeline {
//     agent { docker { image 'maven:3.9.6-eclipse-temurin-17-alpine' } }
    agent any
    tools {
        maven 'maven-3.9.3'
    }
    stages {
        stage('build') {
            steps {
                sh 'mvn clean install'
            }
        }
    }
}