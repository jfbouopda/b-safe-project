FROM openjdk:8-jdk-alpine
ARG JAR_FILE
VOLUME /tmp
COPY run.sh .
COPY ${JAR_FILE} app.jar
EXPOSE 8080
ENTRYPOINT ["run.sh"]
