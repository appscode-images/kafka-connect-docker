#!/bin/bash

$HOME/scripts/distributed-config.sh

echo "Starting Kafka Connect in distributed mode"
# Start Kafka Connect in distributed mode
bin/connect-distributed.sh ${HOME}/config/connect-distributed.properties