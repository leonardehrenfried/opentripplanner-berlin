FROM openjdk:8-jre-slim

COPY Makefile .

RUN apt-get update && \
    apt-get install -y make wget && \
    make build

EXPOSE 8080
EXPOSE 8081

CMD make run
