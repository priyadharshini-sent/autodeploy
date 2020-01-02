FROM golang:1.10
WORKDIR /go/src/app
COPY . .
RUN go install -v
CMD ["app"]

FROM tomcat
COPY /var/jenkins_home/workspace/maven-pipeline/target/sparkjava-hello-world-2.0.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
