# building jar
FROM maven:onbuild-alpine AS builder
WORKDIR /app
COPY . .
RUN mvn install

# preparing release version
FROM java:jre-alpine
ENV APP_CONFIG /app/config.yml
ENV APP_JAR /app/target/trace-producer-svc-1.0-SNAPSHOT.jar
# copy jar and config
COPY --from=builder ${APP_CONFIG} ${APP_CONFIG}
COPY --from=builder ${APP_JAR} ${APP_JAR}
# run
EXPOSE 8080
CMD java -jar ${APP_JAR} server ${APP_CONFIG}