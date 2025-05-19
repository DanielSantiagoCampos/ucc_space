pipeline {
  agent any

  tools {
    jdk 'jdk17'
  }

  environment {
    DATABASE_HOST = 'postgres'
    DATABASE_PORT = '5432'
    DATABASE_USERNAME = 'postgres'
    DATABASE_PASSWORD = 'postgres'
    DATABASE_NAME = 'ucc_space_test'
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/DanielSantiagoCampos/ucc_space.git'
      }
    }

    stage('Install Ruby deps') {
      steps {
        sh '''
          echo "Running Ruby deps"
          whoami
          export RBENV_ROOT=/var/jenkins_home/.rbenv
          export PATH="$RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH"
          eval "$(rbenv init -)"
          rbenv shell 3.2.2
          ruby -v
          gem install bundler -v 2.5.16
          bundle _2.5.16_ install
        '''
      }
    }

    stage('Run Tests') {
      steps {
        sh '''
          echo "Running Run Tests"
        '''
        sh 'bundle install'
        sh 'bundle exec rspec'
      }

      post {
        always {
          junit 'spec/reports/**/*.xml'  // Si usas rspec con formatter JUnit
        }
      }
    }

    stage('Run linters') {
      steps {
        sh '''
          echo "Running rubocop"
        '''
        sh 'bundle exec rubocop'
      }
    }

    stage('Docker Build & Push - Back') {
      steps {
        script {
          withDockerRegistry(credentialsId: 'docker', toolName: 'docker') {
            sh """
              docker build \
                -t camposdaniel10/ucc_space .

              docker push camposdaniel10/ucc_space
            """
          }
        }
      }
    }
  }
}
