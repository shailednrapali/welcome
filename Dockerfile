FROM openjdk:11

USER root
WORKDIR /root

COPY /home/ubuntu/.jenkins/workspace/Second/webapp/target/webapp.war .
CMD ["java", "-jar", "/home/docker/webapp.war"]

#EXPOSE 8080
