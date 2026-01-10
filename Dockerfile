# -------- Build stage --------
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# -------- Run stage --------
FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app

COPY --from=build /app/target/demo*.jar demo.jar

EXPOSE 9080

ENTRYPOINT ["java", "-jar", "demo.jar"]
