# Pull base image 
From tomcat:8-jre8 

# Maintainer name or email
MAINTAINER "valaxytech@gmail.com" 
COPY ./webapp.war /usr/local/tomcat/webapps
