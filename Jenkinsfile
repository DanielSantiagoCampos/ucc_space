pipeline {
    agent {
        docker {
            image 'ruby:3.2'
        }
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
                sh 'gem install bundler'
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
        }
    }
}

