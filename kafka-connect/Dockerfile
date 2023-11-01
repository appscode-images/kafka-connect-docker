FROM obaydullahmhs/kafka-base:latest

ARG MONGO_CONNECTOR_VERSION=1.11.0
ARG S3_AIVEN_CONNECTOR_VERSION=2.15.0
ARG DEBEZIUM_POSTGRES_CONNECTOR_VERSION=2.4.0

USER root

RUN apt-get update \
 && apt install -y vim unzip \
 && wget -P ${HOME}/libs/mongodb https://repo1.maven.org/maven2/org/mongodb/kafka/mongo-kafka-connect/${MONGO_CONNECTOR_VERSION}/mongo-kafka-connect-${MONGO_CONNECTOR_VERSION}-all.jar \
 && wget -P ${HOME}/libs/s3-aiven https://github.com/Aiven-Open/s3-connector-for-apache-kafka/releases/download/v${S3_AIVEN_CONNECTOR_VERSION}/s3-connector-for-apache-kafka-${S3_AIVEN_CONNECTOR_VERSION}.zip \
 && wget -P ${HOME}/libs/postgres-dbzm https://repo1.maven.org/maven2/io/debezium/debezium-connector-postgres/${DEBEZIUM_POSTGRES_CONNECTOR_VERSION}.Final/debezium-connector-postgres-${DEBEZIUM_POSTGRES_CONNECTOR_VERSION}.Final-plugin.tar.gz

COPY scripts/ ${HOME}/scripts/

EXPOSE 8083

# Set ownership of $HOME directory to kafka user
RUN chown -R kafka:kafka $HOME/ && \
    chown -R kafka:kafka /tmp

RUN chmod +x ${HOME}/scripts/*.sh

# Set the entrypoint to the connect-entrypoint.sh script
# ENTRYPOINT [ "./connect-entrypoint.sh" ]
ENTRYPOINT [ "/opt/kafka/scripts/connect-entrypoint.sh" ]

USER kafka



