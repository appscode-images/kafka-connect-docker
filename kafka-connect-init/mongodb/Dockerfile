
# Use a lightweight Linux image as the base
FROM alpine:latest

# Install necessary dependencies
RUN apk add --no-cache wget

COPY entrypoint.sh /opt/kafka/init-scripts/entrypoint.sh

RUN chmod +x /opt/kafka/init-scripts/entrypoint.sh

# Define the entry point command
ENTRYPOINT [ "/opt/kafka/init-scripts/entrypoint.sh" ]
