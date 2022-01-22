
FROM tomcat:8.0.20-jre8

MAINTAINER "valaxytech@gmail.com" 

COPY target/webapp.war /usr/local/tomcat/webapps/webapp.war




