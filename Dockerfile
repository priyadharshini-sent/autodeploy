FROM tomcat
COPY target/sparkjava-hello-world-2.0.war /usr/local/tomcat/webapps/
IMAGE_NAME="priya1410/autodeploy:${BUILD_NUMBER}"
docker build . -t $IMAGE_NAME
CMD ["catalina.sh", "run"]
