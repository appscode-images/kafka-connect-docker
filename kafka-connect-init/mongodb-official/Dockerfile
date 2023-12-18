
# Use a lightweight Linux image as the base
FROM alpine:latest

ARG MONGO_OFFICIAL_CONNECTOR_VERSION=1.11.0

# Install necessary dependencies
RUN apk add --no-cache wget

RUN wget -P /tmp/plugin https://repo1.maven.org/maven2/org/mongodb/kafka/mongo-kafka-connect/${MONGO_OFFICIAL_CONNECTOR_VERSION}/mongo-kafka-connect-${MONGO_OFFICIAL_CONNECTOR_VERSION}-all.jar

# Define the entry point command
ENTRYPOINT [ "/bin/sh", "-c", "cp -r /tmp/plugin/ /opt/kafka/libs/connector-plugins/mongodb-official/" ]
