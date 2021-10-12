pipeline {
    agent {
        label 'Agent1'
    }
    tools {
        maven "Maven1"
    }

    stages {
        stage('Build/Test') {
            steps {
                sh '''
                mvn clean install package
                cp /home/ubuntu/jenkins/workspace/Project4/target/webapp-1.0.war /home/ubuntu/jenkins/workspace/Project4/webapp.war
                bash /home/ubuntu/jenkins/workspace/Project4/Script.sh
                '''
                mail bcc: '', body: 'Please check the functionality of the application!  Link: http://3.66.111.211:8090/webapp/CalculatorServlet', cc: '', from: '', replyTo: '', subject: 'App deployed on test environment!', to: 'andreykawwee@gmail.com'
                input(message: 'Deploy to production?', ok: 'Yes!') 
            }
        }  
        stage('Deploy to Prod') {
            steps {
                sh '''
                scp -i /home/ubuntu/.ssh/1stInstancePair.pem /home/ubuntu/jenkins/workspace/Project4/Script.sh centos@172.31.5.207:/home/centos/Script.sh
                scp -i /home/ubuntu/.ssh/1stInstancePair.pem /home/ubuntu/jenkins/workspace/Project4/Dockerfile centos@172.31.5.207:/home/centos/Dockerfile
                scp -i /home/ubuntu/.ssh/1stInstancePair.pem /home/ubuntu/jenkins/workspace/Project4/webapp.war centos@172.31.5.207:/home/centos/webapp.war
                ssh -i /home/ubuntu/.ssh/1stInstancePair.pem centos@172.31.5.207 ./Script.sh
                '''
            }
        }   
    }
}
