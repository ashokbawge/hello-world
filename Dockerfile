# Pull base image 
From tomcat:8-jre8 

# Maintainer name or email
MAINTAINER "valaxytech@gmail.com" 
COPY /var/lib/jenkins/workspace/Pipeline_job1/webapp/target/webapp.war /usr/local/tomcat/webapps
