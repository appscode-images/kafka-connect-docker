#!/bin/sh

MONGO_CONNECTOR_VERSION=1.11.0

wget -P /opt/kafka/libs/connector-plugins https://repo1.maven.org/maven2/org/mongodb/kafka/mongo-kafka-connect/${MONGO_CONNECTOR_VERSION}/mongo-kafka-connect-${MONGO_CONNECTOR_VERSION}-all.jar

echo "Downloading MongoDB Kafka Connector version ${MONGO_CONNECTOR_VERSION} to /opt/kafka/libs/connector-plugins"
