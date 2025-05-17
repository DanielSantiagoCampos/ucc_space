pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/DanielSantiagoCampos/ucc_space.git'
            }
        }

        stage('Setup Ruby') {
            agent {
                docker {
                    image 'ruby:3.2'  // imagen con Ruby y gem
                    args '-v $HOME/.gem:/usr/local/bundle'  // opcional para persistir gems
                }
            }

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
