pipeline {
  agent any

  stages {
    stage('Instalar dependencias') {
      steps {
        sh 'bundle install'
      }
    }
    stage('Ejecutar pruebas RSpec') {
      steps {
        sh 'bundle exec rspec'
      }
    }
  }
}

