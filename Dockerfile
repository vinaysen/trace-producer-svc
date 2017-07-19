FROM java:jre-alpine
WORKDIR /app

ENV APP_CONFIG ./config.yml
ENV APP_JAR trace-producer-svc.jar
ENV APP_JAR_PATH ./target/${APP_JAR}

COPY ${APP_JAR_PATH} .
COPY ${APP_CONFIG} .

EXPOSE 8080
CMD java -jar ${APP_JAR} server ${APP_CONFIG}