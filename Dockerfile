FROM eclipse-temurin:11-jdk-jammy
 
WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:resolve

COPY src ./src

CMD ["./mvnw", "-Dspring-boot.run.profiles=mysql", "spring-boot:run"
