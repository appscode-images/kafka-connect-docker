#!/bin/bash

server_properties=$HOME/config/kraft/server.properties
KAFKA_CLUSTER_ID="$(bin/kafka-storage.sh random-uuid)"

kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c $server_properties --ignore-formatted

echo "Starting Kafka Server"

cat $server_properties
exec kafka-server-start.sh $server_properties

