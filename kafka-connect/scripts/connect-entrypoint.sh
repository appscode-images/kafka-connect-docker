#!/bin/bash

unzip $HOME/libs/s3-aiven/s3-connector-for-apache-kafka-2.15.0.zip -d $HOME/libs/s3-aiven
rm $HOME/libs/s3-aiven/s3-connector-for-apache-kafka-2.15.0.zip

if [[ DISTRIBUTED == "true" ]]; then
    echo "Starting Kafka Connect in distributed mode"
    # Start Kafka Connect in distributed mode
    bin/connect-distributed.sh ${HOME}/config/connect-distributed.properties
else
    ./standalone.sh
fi
