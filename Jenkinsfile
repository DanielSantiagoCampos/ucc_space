pipeline {
    agent any

    environment {
        RAILS_ENV = 'test'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/DanielSantiagoCampos/ucc_space.git'
            }
        }

        stage('Check Ruby and Bundler') {
            steps {
                sh 'ruby -v'
                sh 'which ruby'
                sh 'bundler -v || gem install bundler'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'bundle install --jobs=4 --retry=3'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'bundle exec rspec'
            }
            post {
                always {
                    // Para que esto funcione, necesitas un formatter JUnit en RSpec
                    junit 'spec/reports/**/*.xml'
                }
            }
        }
    }
}

