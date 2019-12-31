FROM tomcat

ADD sparkjava-hello-world-2.0.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]
