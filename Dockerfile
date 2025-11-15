FROM openjdk:17
COPY "./target/CRUDSABADO-1.jar" "app.jar"
EXPOSE 8508
ENTRYPOINT [ "java", "-jar", "app.jar"]