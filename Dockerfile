FROM openjdk:17-slim
COPY target/calculator-app-0.0.1-SNAPSHOT.jar calculator-app.jar
ENTRYPOINT ["java", "-jar", "calculator-app.jar"]

