FROM eclipse-temurin:21-jdk
COPY "./target/spring_relaciones_ready-1.jar" "app.jar"
EXPOSE 8508
ENTRYPOINT [ "java", "-jar", "app.jar"]