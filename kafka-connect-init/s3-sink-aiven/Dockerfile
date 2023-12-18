
# Use a lightweight Linux image as the base
FROM alpine:latest

# Install necessary dependencies
RUN apk add --no-cache wget

ARG S3_AIVEN_CONNECTOR_VERSION=2.15.0

RUN wget -P /tmp https://github.com/Aiven-Open/s3-connector-for-apache-kafka/releases/download/v${S3_AIVEN_CONNECTOR_VERSION}/s3-connector-for-apache-kafka-${S3_AIVEN_CONNECTOR_VERSION}.zip \
 && unzip /tmp/s3-connector-for-apache-kafka-${S3_AIVEN_CONNECTOR_VERSION}.zip -d /tmp \
 && mv /tmp/s3-connector-for-apache-kafka-${S3_AIVEN_CONNECTOR_VERSION}/ /tmp/plugin
 
# Define the entry point command
ENTRYPOINT [ "/bin/sh", "-c", "cp -r /tmp/plugin/ /opt/kafka/libs/connector-plugins/s3-sink-aiven/" ]
