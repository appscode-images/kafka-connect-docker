#!/bin/bash

unzip $HOME/libs/s3-aiven/s3-connector-for-apache-kafka-2.15.0.zip -d $HOME/libs/s3-aiven
rm $HOME/libs/s3-aiven/s3-connector-for-apache-kafka-2.15.0.zip

tar -xvf $HOME/libs/postgres-dbzm/debezium-connector-postgres-2.4.0.Final-plugin.tar.gz -C $HOME/libs/postgres-dbzm
rm $HOME/libs/postgres-dbzm/debezium-connector-postgres-2.4.0.Final-plugin.tar.gz

if [[ $DISTRIBUTED == "true" ]]; then
    $HOME/scripts/distributed.sh
else
    $HOME/scripts/standalone.sh
fi
