# Use a lightweight Linux image as the base
FROM alpine:latest

# Install necessary dependencies
RUN apk add --no-cache wget

ARG POSTGRES_DEBEZIUM_CONNECTOR_VERSION=2.4.2.Final

RUN wget -P /tmp https://repo1.maven.org/maven2/io/debezium/debezium-connector-postgres/${POSTGRES_DEBEZIUM_CONNECTOR_VERSION}/debezium-connector-postgres-${POSTGRES_DEBEZIUM_CONNECTOR_VERSION}-plugin.tar.gz \
 && tar -xvf /tmp/debezium-connector-postgres-${POSTGRES_DEBEZIUM_CONNECTOR_VERSION}-plugin.tar.gz -C /tmp \
 && mkdir -p /tmp/plugin && mv /tmp/debezium-connector-postgres/*.jar /tmp/plugin/

# Define the entry point command
ENTRYPOINT [ "/bin/sh", "-c", "cp -r /tmp/plugin/ /opt/kafka/libs/connector-plugins/postgres-source-debezium/" ]
