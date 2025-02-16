pipeline {
    agent any
    stages {

        stage('Docker') {
            agent {
                docker {
                    image 'docker:latest'
                    args '-v /var/run/docker.sock:/var/run/docker.sock -u 0:0'
                }
            }
            environment {
                DOCKER_LOGIN = credentials('DOCKER_LOGIN')
                VERSION = '1.32'
            }
            steps {
                sh '''
                    echo $DOCKER_LOGIN_PSW | docker login -u $DOCKER_LOGIN_USR --password-stdin
                    docker build -t pilet/jenkins-cicd:$VERSION .
                    docker push pilet/jenkins-cicd:$VERSION
                '''
            }
        }

    }
}