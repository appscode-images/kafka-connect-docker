FROM openjdk:11-jre-slim-buster

ARG KAFKA_VERSION=3.5.1
ENV KAFKA_VERSION=${KAFKA_VERSION}
ENV SCALA_VERSION=2.13
ENV HOME=/opt/kafka
ENV PATH=${PATH}:${HOME}/bin

RUN apt-get update \
 && apt-get install -y wget \
 && wget -O /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
 && tar xfz /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt \
 && rm /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
 && ln -s /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} ${HOME} \
 && rm -rf /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

WORKDIR ${HOME}

COPY docker-entrypoint.sh ${HOME}

RUN groupadd --gid 1001 --system kafka && \
    useradd --uid 1001 --system --gid kafka --home-dir $HOME kafka && \
    chown -R kafka:kafka $HOME/ && \
    chown -R kafka:kafka /tmp

EXPOSE 9092 9093

RUN chmod +x docker-entrypoint.sh 

ENTRYPOINT ["./docker-entrypoint.sh"]

USER kafka
