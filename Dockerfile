FROM openjdk:11

USER root
WORKDIR /home/ubuntu/.jenkins/workspace/Second/webapp/target/

COPY /webapp.war .
CMD ["java", "-jar", "/home/ubuntu/.jenkins/workspace/Second/webapp/target/webapp.war"]

#EXPOSE 8080
