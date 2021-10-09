FROM tomcat:9
MAINTAINER "andreykawwee@gmail.com"
COPY ./webapp.war /usr/local/tomcat/webapps/webapp.war
