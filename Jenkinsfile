pipeline {
  agent any

  tools {
    jdk 'jdk17'
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/DanielSantiagoCampos/ucc_space.git'
      }
    }

    stage('Run Tests') {
      steps {
        sh 'bundle install'
        sh 'bundle exec rspec'
      }

      post {
        always {
          junit 'spec/reports/**/*.xml'  // Si usas rspec con formatter JUnit
        }
      }
    }
  }
}
