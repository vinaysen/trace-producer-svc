# building jar
FROM maven:onbuild-alpine AS builder
WORKDIR /app
COPY . .
RUN mvn install

# preparing release version
FROM java:jre-alpine
ENV APP_TARGET_PATH ${APP_HOME}/target
WORKDIR /app
COPY --from=builder ${APP_TARGET_PATH} ${APP_TARGET_PATH}
EXPOSE 8081
CMD java -jar ${APP_TARGET_PATH}/trace-producer-svc-1.0-SNAPSHOT.jar server config.yml