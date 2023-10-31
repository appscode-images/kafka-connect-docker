#!/bin/bash

unzip $HOME/libs/s3-aiven/s3-connector-for-apache-kafka-2.15.0.zip -d $HOME/libs/s3-aiven
rm $HOME/libs/s3-aiven/s3-connector-for-apache-kafka-2.15.0.zip

# Set the Kafka Connect standalone mode properties
# export CONNECT_BOOTSTRAP_SERVERS="localhost:9092"
# export CONNECT_REST_ADVERTISED_HOST_NAME="localhost"
# export CONNECT_REST_PORT="8083"
# export MONGO_URI="mongodb://localhost:27017"
# export MONGO_DATABASE="test"
# export MONGO_COLLECTION="source"
# export AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_KEY_ID
# export AWS_SECRET_ACCESS_KEY=YOUR_AWS_SECRET_ACCESS_KEY
# export AWS_REGION=YOUR_AWS_REGION
# export S3_BUCKET_NAME=YOUR_S3_BUCKET_NAME
# export S3_ENDPOINT=YOUR_S3_ENDPOINT
# export S3_PART_SIZE=5242880
# export TOPICS_SINK=topic1,topic2

export CONNECT_GROUP_ID="connect-cluster"
export CONNECT_CONFIG_STORAGE_TOPIC="connect-configs"
export CONNECT_OFFSET_STORAGE_TOPIC="connect-offsets"
export CONNECT_STATUS_STORAGE_TOPIC="connect-status"
export CONNECT_KEY_CONVERTER="org.apache.kafka.connect.json.JsonConverter"
export CONNECT_VALUE_CONVERTER="org.apache.kafka.connect.json.JsonConverter"
export CONNECT_INTERNAL_KEY_CONVERTER="org.apache.kafka.connect.json.JsonConverter"
export CONNECT_INTERNAL_VALUE_CONVERTER="org.apache.kafka.connect.json.JsonConverter"


# This script updates the values of the AWS access key ID, AWS secret access key, S3 bucket name, S3 endpoint, AWS region, and topics in the s3-sink-aiven.properties file located at ${HOME}/config/s3-sink-aiven.properties. The new values are taken from the environment variables AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, S3_BUCKET_NAME, S3_ENDPOINT, AWS_REGION, and MONGOURI respectively. The script uses sed command to replace the old values with the new ones.
# obaydullahmhs/kafka-connect-docker/kafka-connect/scripts/connect-entrypoint-distributed.sh

sed -i "s|aws.access.key.id=.*|aws.access.key.id=$AWS_ACCESS_KEY_ID|g" ${HOME}/config/s3-sink-aiven.properties
sed -i "s|aws.secret.access.key=.*|aws.secret.access.key=$AWS_SECRET_ACCESS_KEY|g" ${HOME}/config/s3-sink-aiven.properties
sed -i "s|aws.s3.bucket.name=.*|aws.s3.bucket.name=$S3_BUCKET_NAME|g" ${HOME}/config/s3-sink-aiven.properties
sed -i "s|aws.s3.endpoint=.*|aws.s3.endpoint=$S3_ENDPOINT|g" ${HOME}/config/s3-sink-aiven.properties
sed -i "s|aws.s3.region=.*|aws.s3.region=$AWS_REGION|g" ${HOME}/config/s3-sink-aiven.properties
sed -i "s|topics=.*|topics=${TOPICS_SINK}|g" ${HOME}/config/s3-sink-aiven.properties

sed -i "s|connection.uri=.*|connection.uri=$MONGO_URI|g" ${HOME}/config/MongoSourceConnector.properties
sed -i "s|database=.*|database=$MONGO_DATABASE|g" ${HOME}/config/MongoSourceConnector.properties
sed -i "s|collection=.*|collection=$MONGO_COLLECTION|g" ${HOME}/config/MongoSourceConnector.properties

sed -i "s|bootstrap.servers=.*|bootstrap.servers=$CONNECT_BOOTSTRAP_SERVERS|g" ${HOME}/config/connect-standalone-mg.properties




# Start Kafka Connect in standalone mode
bin/connect-standalone.sh ${HOME}/config/connect-standalone-mg.properties ${HOME}/config/MongoSourceConnector.properties ${HOME}/config/s3-sink-aiven.properties
