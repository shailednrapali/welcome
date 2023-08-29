FROM adoptopenjdk:11-jdk-hotspot AS build

ARG user=appuser
ARG group=appuser

RUN addgroup -S appuser && adduser -S $user -G appuser

COPY /home/ubuntu/.jenkins/workspace/Second/webapp/target/webapp.war .
CMD ["java", "-jar", "/home/ubuntu/.jenkins/workspace/Second/webapp/target/webapp.war"]

RUN chown -R $user:$user /home/$user/

RUN chmod -R 755 /home/$user/

EXPOSE 8080

WORKDIR /home/$user

ENTRYPOINT ["java","-jar","-Dspring.profiles.active=mysql","/app.jar"]
