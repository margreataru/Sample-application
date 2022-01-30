pipeline {
    environment {
        registry = 'sreeharshav/devopsb17'
        registryCredential = '8074374526'
        dockerSwarmManager = '10.2.1.43:2377'
        dockerhost = '10.2.1.43'
        dockerImage = ''
    }
    agent any
    stages {
        stage('Cloning our Git') {
            steps {
                git 'https://github.com/margreataru/Jyothi.git'
            }
        }
        stage('Building our image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":v$BUILD_NUMBER"
                }
            }
        }
        stage('Push Image To DockerHUB') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Cleaning up') {
            steps {
                sh "docker rmi $registry:v$BUILD_NUMBER"
            }
        }
        stage('Deploying to Docker Swarm') {
            steps {
                sh "docker -H tcp://$dockerSwarmManager service rm testing1 || true"
                sh "docker -H tcp://$dockerSwarmManager service create --name testing1 -p 8100:80 $registry:v$BUILD_NUMBER"
            }
        }
        stage('Verifying The Deployment') {
            steps {
                sh 'curl http://$dockerhost:8100 || exit 1'
                }
        }
    }
}
