# building jar
FROM maven:onbuild-alpine AS builder
WORKDIR /app
COPY . .
RUN mvn install

# preparing release version
FROM java:jre-alpine
ENV APP_JAR_PATH ${APP_HOME}/target/trace-producer-svc-1.0-SNAPSHOT.jar
WORKDIR /app
COPY --from=builder ${APP_JAR_PATH} ${APP_JAR_PATH}
EXPOSE 8081
CMD java -jar ${APP_JAR_PATH} server config.yml