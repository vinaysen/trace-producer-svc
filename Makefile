default: run-docker

# cleanup the workspace
.PHONY: clean
clean:
	mvn clean

# static check & unit testing
.PHONY: test
test:
	mvn test

# building executables
.PHONY: build
build:
	mvn package

# running on local
.PHONY: run-dev
run-dev: build
	java -jar target/trace-producer-svc-1.0-SNAPSHOT.jar server config.yml

# integration testing
.PHONY: integration-test
integration-test: build-docker
	# # stack deploy trace-with-redis
	# # docker build test image
	# # join network
	# # export volume
	# # run integration tests

.PHONY: build-docker
build-docker: test
	docker build -t trace-producer-svc .

.PHONY: run-docker
run-docker: build-docker
	docker run -p 8080:8080 trace-producer-svc
