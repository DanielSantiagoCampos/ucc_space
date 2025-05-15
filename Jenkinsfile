pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/tu_usuario/tu_repositorio.git'
            }
        }

        stage('Setup Ruby') {
            steps {
                sh 'gem install bundler'
                sh 'bundle install --jobs=4 --retry=3'
            }
        }

        stage('Run Tests') {
            steps {
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

