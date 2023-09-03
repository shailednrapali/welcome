FROM adoptopenjdk:11-jdk-hotspot AS build

COPY /home/ubuntu/.jenkins/workspace/Second/webapp/target/webapp.war .
CMD ["java", "-jar", "/home/docker/webapp.war"]

#EXPOSE 8080
