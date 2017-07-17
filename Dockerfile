# building jar
FROM maven:onbuild-alpine AS builder
ENV APP_HOME /app
WORKDIR ${APP_HOME}
COPY . .
RUN mvn install

# preparing release version
FROM maven:jre-alpine
ENV APP_JAR_PATH ${APP_HOME}/target/trace-producer-svc-1.0-SNAPSHOT.jar
WORKDIR ${APP_HOME}
COPY --from=builder ${APP_JAR_PATH} ${APP_JAR_PATH}
EXPOSE 8081
CMD java -jar ${APP_JAR_PATH} server config.yml