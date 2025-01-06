pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "node-docker-app:latest"
        DOCKER_REGISTRY = "votre-registry-si-necessaire"
    }
    stages {
        stage('Cloner le code') {
            steps {
                checkout scm
            }
        }
        stage('Construire l\'image Docker') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }
        stage('Exécuter l\'image Docker') {
            steps {
                script {
                    docker.image("${DOCKER_IMAGE}").run('-d -p 3000:3000')
                }
            }
        }
        stage('Pousser l\'image dans un registre (optionnel)') {
            when {
                expression { return env.DOCKER_REGISTRY }
            }
            steps {
                script {
                    docker.withRegistry("https://${DOCKER_REGISTRY}", 'credentials-id') {
                        docker.image("${DOCKER_IMAGE}").push()
                    }
                }
            }
        }
    }
}
