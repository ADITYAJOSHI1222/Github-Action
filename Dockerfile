FROM maven:3.6.3-jdk-11-slim AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/myapp.jar ./myapp.jar
EXPOSE 8080
CMD ["java", "-jar", "myapp.jar"]
