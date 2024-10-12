FROM openjdk:17-jre-slim
COPY target/calculator-app.jar calculator-app.jar
ENTRYPOINT ["java", "-jar", "calculator-app.jar"]

