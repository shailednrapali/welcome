# Stage 1: Build stage
# Use a lightweight base image for SSH operations
FROM alpine:latest AS build

# Install SSH client (you can remove this after copying the war file)
RUN apk add --no-cache openssh-client

# Copy your private SSH key to the build container (if needed)
# COPY id_rsa /root/.ssh/id_rsa
# RUN chmod 600 /root/.ssh/id_rsa

# Copy the webapp.war file from your EC2 instance to the build container
COPY webapp.war /tmp/webapp.war

# Stage 2: Final stage
# Use the official OpenJDK 11 image as the base image for your application
FROM openjdk:11

# Create a directory in the container to copy the WAR file into
WORKDIR /app

# Copy the WAR file from the build stage to the final image
COPY --from=build /tmp/webapp.war .

# Command to run when the container starts
CMD ["java", "-jar", "webapp.war"]
