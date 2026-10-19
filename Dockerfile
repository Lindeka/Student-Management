# Step 1: Build the artifact using Maven
FROM maven:3.8.5-openjdk-21 AS build
COPY . .
RUN mvn clean package -DskipTests
# Step 2: Run the built JAR file using a slim Java runtime
FROM openjdk:17-jdk-slim
COPY --from=build /student-management/student-management/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
