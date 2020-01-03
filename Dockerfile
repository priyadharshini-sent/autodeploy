RUN curl -fsSLO https://get.docker/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz

FROM tomcat
COPY /var/jenkins_home/workspace/maven-pipeline/target/sparkjava-hello-world-2.0.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
