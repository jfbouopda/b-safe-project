FROM openjdk:8-jdk-alpine
ARG JAR_FILE
VOLUME /tmp
EXPOSE 8080/tcp
EXPOSE 8080/udp
COPY run.sh .
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["run.sh"]
