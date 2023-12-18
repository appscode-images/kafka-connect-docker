
# Use a lightweight Linux image as the base
FROM alpine:latest

ARG GCS_AIVEN_CONNECTOR_VERSION=0.13.0

# Install necessary dependencies
RUN apk add --no-cache wget

RUN wget -P /tmp https://github.com/Aiven-Open/gcs-connector-for-apache-kafka/releases/download/v${GCS_AIVEN_CONNECTOR_VERSION}/gcs-connector-for-apache-kafka-${GCS_AIVEN_CONNECTOR_VERSION}.zip \
 && unzip /tmp/gcs-connector-for-apache-kafka-${GCS_AIVEN_CONNECTOR_VERSION}.zip -d /tmp/ \
 && mv /tmp/gcs-connector-for-apache-kafka-${GCS_AIVEN_CONNECTOR_VERSION}/ /tmp/plugin

# Define the entry point command
ENTRYPOINT [ "/bin/sh", "-c", "cp -r /tmp/plugin/ /opt/kafka/libs/connector-plugins/gcs-sink-aiven" ]
