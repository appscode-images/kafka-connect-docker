#!/bin/bash

# Check if CONNECT_BOOTSTRAP_SERVERS is set
if [ -n "$CONNECT_BOOTSTRAP_SERVERS" ]; then
    # Replace bootstrap.servers in connect-distributed.properties with CONNECT_BOOTSTRAP_SERVERS
    sed -i "s|bootstrap.servers=.*|bootstrap.servers=$CONNECT_BOOTSTRAP_SERVERS|g" ${HOME}/config/connect-distributed.properties
fi

# Check it VALUE_CONVERTER is set
if [ -n "$CONNECT_VALUE_CONVERTER" ]; then
    # Replace value.converter in connect-distributed.properties with CONNECT_VALUE_CONVERTER
    sed -i "s|value.converter=.*|value.converter=$CONNECT_VALUE_CONVERTER|g" ${HOME}/config/connect-distributed.properties
fi

# Check if KEY_CONVERTER is set
if [ -n "$CONNECT_KEY_CONVERTER" ]; then
    # Replace key.converter in connect-distributed.properties with CONNECT_KEY_CONVERTER
    sed -i "s|key.converter=.*|key.converter=$CONNECT_KEY_CONVERTER|g" ${HOME}/config/connect-distributed.properties
fi

# Check if GROUP_ID is set
if [ -n "$CONNECT_GROUP_ID" ]; then
    # Replace group.id in connect-distributed.properties with CONNECT_GROUP_ID
    sed -i "s|group.id=.*|group.id=$CONNECT_GROUP_ID|g" ${HOME}/config/connect-distributed.properties
fi

# Check if CONNECT_KEY_CONVERTER_SCHEMAS_ENABLE is set
if [ -n "$CONNECT_KEY_CONVERTER_SCHEMAS_ENABLE" ]; then
    # Replace key.converter.schemas.enable in connect-distributed.properties with CONNECT_KEY_CONVERTER_SCHEMAS_ENABLE
    sed -i "s|key.converter.schemas.enable=.*|key.converter.schemas.enable=$CONNECT_KEY_CONVERTER_SCHEMAS_ENABLE|g" ${HOME}/config/connect-distributed.properties
fi

# Check if CONNECT_VALUE_CONVERTER_SCHEMAS_ENABLE is set
if [ -n "$CONNECT_VALUE_CONVERTER_SCHEMAS_ENABLE" ]; then
    # Replace value.converter.schemas.enable in connect-distributed.properties with CONNECT_VALUE_CONVERTER_SCHEMAS_ENABLE
    sed -i "s|value.converter.schemas.enable=.*|value.converter.schemas.enable=$CONNECT_VALUE_CONVERTER_SCHEMAS_ENABLE|g" ${HOME}/config/connect-distributed.properties
fi

# Check if CONNECT_OFFSET_STORAGE_TOPIC is set
if [ -n "$CONNECT_OFFSET_STORAGE_TOPIC" ]; then
    # Replace offset.storage.topic in connect-distributed.properties with CONNECT_OFFSET_STORAGE_TOPIC
    sed -i "s|offset.storage.topic=.*|offset.storage.topic=$CONNECT_OFFSET_STORAGE_TOPIC|g" ${HOME}/config/connect-distributed.properties
fi

# Check if CONNECT_OFFSET_STORAGE_REPLICATION_FACTOR is set
if [ -n "$CONNECT_OFFSET_STORAGE_REPLICATION_FACTOR" ]; then
    # Replace offset.storage.replication.factor in connect-distributed.properties with CONNECT_OFFSET_STORAGE_REPLICATION_FACTOR
    sed -i "s|offset.storage.replication.factor=.*|offset.storage.replication.factor=$CONNECT_OFFSET_STORAGE_REPLICATION_FACTOR|g" ${HOME}/config/connect-distributed.properties
fi

# Check if CONNECT_CONFIG_STORAGE_TOPIC is set
if [ -n "$CONNECT_CONFIG_STORAGE_TOPIC" ]; then
    # Replace config.storage.topic in connect-distributed.properties with CONNECT_CONFIG_STORAGE_TOPIC
    sed -i "s|config.storage.topic=.*|config.storage.topic=$CONNECT_CONFIG_STORAGE_TOPIC|g" ${HOME}/config/connect-distributed.properties
fi

# Check if CONNECT_CONFIG_STORAGE_REPLICATION_FACTOR is set
if [ -n "$CONNECT_CONFIG_STORAGE_REPLICATION_FACTOR" ]; then
    # Replace config.storage.replication.factor in connect-distributed.properties with CONNECT_CONFIG_STORAGE_REPLICATION_FACTOR
    sed -i "s|config.storage.replication.factor=.*|config.storage.replication.factor=$CONNECT_CONFIG_STORAGE_REPLICATION_FACTOR|g" ${HOME}/config/connect-distributed.properties
fi

# Check if CONNECT_STATUS_STORAGE_TOPIC is set
if [ -n "$CONNECT_STATUS_STORAGE_TOPIC" ]; then
    # Replace status.storage.topic in connect-distributed.properties with CONNECT_STATUS_STORAGE_TOPIC
    sed -i "s|status.storage.topic=.*|status.storage.topic=$CONNECT_STATUS_STORAGE_TOPIC|g" ${HOME}/config/connect-distributed.properties
fi

# Check if CONNECT_STATUS_STORAGE_REPLICATION_FACTOR is set
if [ -n "$CONNECT_STATUS_STORAGE_REPLICATION_FACTOR" ]; then
    # Replace status.storage.replication.factor in connect-distributed.properties with CONNECT_STATUS_STORAGE_REPLICATION_FACTOR
    sed -i "s|status.storage.replication.factor=.*|status.storage.replication.factor=$CONNECT_STATUS_STORAGE_REPLICATION_FACTOR|g" ${HOME}/config/connect-distributed.properties
fi

# Check if CONNECT_OFFSET_FLUSH_INTERVAL_MS is set
if [ -n "$CONNECT_OFFSET_FLUSH_INTERVAL_MS" ]; then
    # Replace offset.flush.interval.ms in connect-distributed.properties with CONNECT_OFFSET_FLUSH_INTERVAL_MS
    sed -i "s|offset.flush.interval.ms=.*|offset.flush.interval.ms=$CONNECT_OFFSET_FLUSH_INTERVAL_MS|g" ${HOME}/config/connect-distributed.properties
fi


# Add default rest.advertised.host.name=$HOSTNAME
sed -i "s|#rest.advertised.host.name=.*|rest.advertised.host.name=$HOSTNAME|g" ${HOME}/config/connect-distributed.properties

# Check if SERVICE_DNS is set   
if [ -n "$SERVICE_DNS" ]; then
    # Add default rest.advertised.host.name=$HOSTNAME
    sed -i "s|rest.advertised.host.name=.*|rest.advertised.host.name=$HOSTNAME.$SERVICE_DNS|g" ${HOME}/config/connect-distributed.properties
fi

# Check if CONNECT_REST_ADVERTISED_HOST_NAME is set
if [ -n "$CONNECT_REST_ADVERTISED_HOST_NAME" ]; then
    # Replace rest.advertised.host.name in connect-distributed.properties with CONNECT_REST_ADVERTISED_HOST_NAME
    sed -i "s|rest.advertised.host.name=.*|rest.advertised.host.name=$CONNECT_REST_ADVERTISED_HOST_NAME|g" ${HOME}/config/connect-distributed.properties
fi

# Add default rest.advertised.port=8083
sed -i "s|#rest.advertised.port=.*|rest.advertised.port=8083|g" ${HOME}/config/connect-distributed.properties

# Check if CONNECT_REST_ADVERTISED_PORT is set
if [ -n "$CONNECT_REST_ADVERTISED_PORT" ]; then
    # Replace rest.advertised.port in connect-distributed.properties with CONNECT_REST_ADVERTISED_PORT
    sed -i "s|rest.advertised.port=.*|rest.advertised.port=$CONNECT_REST_ADVERTISED_PORT|g" ${HOME}/config/connect-distributed.properties
fi

# Add default rest.advertised.listener=http
sed -i "s|#rest.advertised.listener=.*|rest.advertised.listener=http|g" ${HOME}/config/connect-distributed.properties

# Check if CONNECT_REST_ADVERTISED_LISTENER is set
if [ -n "$CONNECT_REST_ADVERTISED_LISTENER" ]; then
    # Replace rest.advertised.listener in connect-distributed.properties with CONNECT_REST_ADVERTISED_LISTENER
    sed -i "s|rest.advertised.listener=.*|rest.advertised.listener=$CONNECT_REST_ADVERTISED_LISTENER|g" ${HOME}/config/connect-distributed.properties
fi

# Check if LISTENERS is set
if [ -n "$CONNECT_LISTENERS" ]; then
    # Replace listeners in connect-distributed.properties with CONNECT_LISTENERS
    sed -i "s|#listeners=.*|listeners=$CONNECT_LISTENERS|g" ${HOME}/config/connect-distributed.properties
fi

# Add default plugin.path=${HOME}/libs
sed -i "s|#plugin.path=.*|plugin.path=$HOME/libs|g" ${HOME}/config/connect-distributed.properties

# Check if PLUGIN_PATH is set
if [ -n "$PLUGIN_PATH" ]; then
    # Replace plugin.path in connect-distributed.properties with PLUGIN_PATH
    sed -i "s|plugin.path=.*|plugin.path=$PLUGIN_PATH|g" ${HOME}/config/connect-distributed.properties
fi
