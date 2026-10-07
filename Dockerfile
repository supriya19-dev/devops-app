FROM eclipse-temurin:21-jre
COPY target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]