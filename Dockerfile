FROM adoptopenjdk:11-jdk-hotspot AS build

# Create the appuser group
RUN groupadd appuser

# Create the docker user, set the home directory, and add to the appuser group
RUN useradd -m -g appuser docker

COPY /home/ubuntu/.jenkins/workspace/Second/webapp/target/webapp.war .
CMD ["java", "-jar", "/home/docker/webapp.war"]

EXPOSE 8080
