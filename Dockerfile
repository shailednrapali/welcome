# Use the official OpenJDK 11 image as the base image
FROM openjdk:11

# Create a directory in the container to copy the WAR file into
WORKDIR /app

# Copy the webapp.war file from your local machine (Ubuntu EC2 host) into the container
COPY /home/ubuntu/.jenkins/workspace/Second/webapp/target/webapp.war .

# Command to run when the container starts
CMD ["java", "-jar", "webapp.war"]
