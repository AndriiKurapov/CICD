pipeline {
    agent {
        label 'Agent1'
    }
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven1"
    }

    stages {
        stage('Build/Test') {
            steps {
                // Get some code from a GitHub repository
                //git 'https://github.com/AndriiKurapov/CICD.git'

                // Run Maven on a Unix agent.
                sh '''
                mvn clean install package
                sudo cp /home/ubuntu/jenkins/workspace/Project4/target/HTTPRequest-1.0-SNAPSHOT.war /var/lib/tomcat9/webapps/webapp.war
                '''
            }
        }
        stage('Deploy to Prod') {
            steps {
                sh '''
                scp -i /home/ubuntu/.ssh/1stInstancePair.pem /home/ubuntu/jenkins/workspace/Project1/Script.sh centos@172.31.5.207:/home/centos/Script.sh
                scp -i /home/ubuntu/.ssh/1stInstancePair.pem /home/ubuntu/jenkins/workspace/Project1/Dockerfile centos@172.31.5.207:/home/centos/Dockerfile
                scp -i /home/ubuntu/.ssh/1stInstancePair.pem /home/ubuntu/jenkins/workspace/Project1/target/HTTPRequest-1.0-SNAPSHOT.war centos@172.31.5.207:/home/centos/webapp.war
                ssh -i /home/ubuntu/.ssh/1stInstancePair.pem centos@172.31.5.207 ./Script.sh
                '''
            }
        }   
    }
}
