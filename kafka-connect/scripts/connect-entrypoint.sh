#!/bin/bash

unzip $HOME/libs/s3-aiven/s3-connector-for-apache-kafka-2.15.0.zip -d $HOME/libs/s3-aiven
rm $HOME/libs/s3-aiven/s3-connector-for-apache-kafka-2.15.0.zip

if [[ $DISTRIBUTED == "true" ]]; then
    $HOME/scripts/distributed.sh
else
    $HOME/scripts/standalone.sh
fi
