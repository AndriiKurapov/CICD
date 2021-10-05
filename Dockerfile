FROM tomcat:9
MAINTAINER "andreykawwee@gmail.com"
WORKDIR /home/centos
COPY ./webapp.war /usr/local/tomcat/webapps/webapp.war