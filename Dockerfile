FROM openjdk:11

USER root
WORKDIR /usr/bin

COPY /home/ubuntu/.jenkins/workspace/Second/webapp/target/webapp.war .
CMD ["java", "-jar", "/home/ubuntu/.jenkins/workspace/Second/webapp/target/webapp.war"]

#EXPOSE 8080
