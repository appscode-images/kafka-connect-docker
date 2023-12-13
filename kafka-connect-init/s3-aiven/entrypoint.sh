#!/bin/sh

S3_AIVEN_CONNECTOR_VERSION=2.15.0

echo "Downloading S3 Aiven Kafka Connector version ${S3_AIVEN_CONNECTOR_VERSION} to /opt/kafka/libs/s3-aiven"
wget -P /opt/kafka/libs/connector-plugins https://github.com/Aiven-Open/s3-connector-for-apache-kafka/releases/download/v${S3_AIVEN_CONNECTOR_VERSION}/s3-connector-for-apache-kafka-${S3_AIVEN_CONNECTOR_VERSION}.zip

unzip /opt/kafka/libs/connector-plugins/s3-connector-for-apache-kafka-${S3_AIVEN_CONNECTOR_VERSION}.zip -d /opt/kafka/libs/connector-plugins
rm /opt/kafka/libs/connector-plugins/s3-connector-for-apache-kafka-${S3_AIVEN_CONNECTOR_VERSION}.zip

