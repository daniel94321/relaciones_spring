FROM openjdk:21
COPY "./target/spring_relaciones_ready-1.jar" "app.jar"
EXPOSE 8508
ENTRYPOINT [ "java", "-jar", "app.jar"]