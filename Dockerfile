FROM openjdk:17

LABEL maintainer="tinyfingers"

WORKDIR /app

COPY target/petshop-0.0.1-SNAPSHOT.jar /app/petshop-0.0.1-SNAPSHOT.jar

EXPOSE 8888

CMD ["java", "-jar", "petshop-0.0.1-SNAPSHOT.jar"]
