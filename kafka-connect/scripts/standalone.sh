#!/bin/bash

export PLUGIN_PATH=${HOME}/libs/

# Check if CONNECT_BOOTSTRAP_SERVERS is set
if [ -n "$CONNECT_BOOTSTRAP_SERVERS" ]; then
    # Replace bootstrap.servers in connect-standalone.properties with CONNECT_BOOTSTRAP_SERVERS
    sed -i "s|bootstrap.servers=.*|bootstrap.servers=$CONNECT_BOOTSTRAP_SERVERS|g" ${HOME}/config/connect-standalone.properties
fi

# Check it VALUE_CONVERTER is set
if [ -n "$CONNECT_VALUE_CONVERTER" ]; then
    # Replace value.converter in connect-standalone.properties with CONNECT_VALUE_CONVERTER
    sed -i "s|value.converter=.*|value.converter=$CONNECT_VALUE_CONVERTER|g" ${HOME}/config/connect-standalone.properties
fi

# Check if KEY_CONVERTER is set
if [ -n "$CONNECT_KEY_CONVERTER" ]; then
    # Replace key.converter in connect-standalone.properties with CONNECT_KEY_CONVERTER
    sed -i "s|key.converter=.*|key.converter=$CONNECT_KEY_CONVERTER|g" ${HOME}/config/connect-standalone.properties
fi

# Check if OFFSET_STORAGE_FILE_FILENAME is set
if [ -n "$CONNECT_OFFSET_STORAGE_FILE_FILENAME" ]; then
    # Replace offset.storage.file.filename in connect-standalone.properties with CONNECT_OFFSET_STORAGE_FILE_FILENAME
    sed -i "s|offset.storage.file.filename=.*|offset.storage.file.filename=$CONNECT_OFFSET_STORAGE_FILE_FILENAME|g" ${HOME}/config/connect-standalone.properties
fi

# Check if OFFSET_FLUSH_INTERVAL_MS is set
if [ -n "$CONNECT_OFFSET_FLUSH_INTERVAL_MS" ]; then
    # Replace offset.flush.interval.ms in connect-standalone.properties with CONNECT_OFFSET_FLUSH_INTERVAL_MS
    sed -i "s|offset.flush.interval.ms=.*|offset.flush.interval.ms=$CONNECT_OFFSET_FLUSH_INTERVAL_MS|g" ${HOME}/config/connect-standalone.properties
fi

# Add Plugin Path
echo "plugin.path=${PLUGIN_PATH}" >> ${HOME}/config/connect-standalone.properties

echo "Starting Kafka Connect in standalone mode"
# Start Kafka Connect in standalone mode
bin/connect-standalone.sh ${HOME}/config/connect-standalone.properties
