# kafka-connect

`MongoDB source connector using curl`
```
curl -X POST http://localhost:8083/connectors -H 'Content-Type: application/json' -d '{
        "name": "mongo-source",
        "config": {
            "connector.class": "com.mongodb.kafka.connect.MongoSourceConnector",
            "tasks.max": 1,
            "connection.uri": "bW9uZ29kYitzcnY6Ly9rYWZrYTpjb25uZWN0QGthZmthLnVpaHZ6emkubW9uZ29kYi5uZXQK",
            "topic.prefix": "mongo",
            "database": "test",
            "collection": "source",
            "poll.max.batch.size": 1000,
            "poll.await.time.ms": 5000,
            "heartbeat.interval.ms": 3000,
            "offset.partition.name": "mongo-source.2",
            "startup.mode": "copy_existing",
            "publish.full.document.only": true,
            "key.ignore": true,
            "value.converter": "org.apache.kafka.connect.json.JsonConverter",
            "value.converter.schemas.enable": false
        }
    }'
```

`Aiven sink s3 connector using curl`
`Change access key, secret key and bucket-name`

```
curl -X POST http://localhost:8083/connectors -H 'Content-Type: application/json' -d '{
    "name": "my_s3_sink",
    "config": {
        "connector.class": "io.aiven.kafka.connect.s3.AivenKafkaConnectS3SinkConnector",
        "key.converter": "org.apache.kafka.connect.storage.StringConverter",
        "value.converter": "org.apache.kafka.connect.json.JsonConverter",
        "value.converter.schemas.enable": false,
        "format.output.type": "jsonl",
        "topics": "mongo.test.source",
        "aws.access.key.id": "XX",
        "aws.secret.access.key": "XX",
        "aws.s3.region": "ap-south-1",
        "aws.s3.endpoint": "ap-south-1.linodeobjects.com",
        "file.name.template": "November1/{{topic}}-{{partition:padding=true}}-{{start_offset:padding=true}}.gz",
        "aws.s3.bucket.name": "kafka",
        "format.output.fields": "key,value,offset,timestamp",
        "format.output.envelope": true,
        "file.compression.type": "gzip",
        "timestamp.timezone": "Europe/Berlin",
        "timestamp.source": "wallclock"
    }
}'
```

curl -X POST -k -u "connect:F6stariFjs*bwknP"  https://172.104.37.95:8083/connectors -H 'Content-Type: application/json' -d '{
        "name": "mongo-source",
        "config": {
            "connector.class": "com.mongodb.kafka.connect.MongoSourceConnector",
            "tasks.max": 1,
            "connection.uri": "bW9uZ29kYitzcnY6Ly9rYWZrYTpjb25uZWN0QGthZmthLnVpaHZ6emkubW9uZ29kYi5uZXQK",
            "topic.prefix": "mongo",
            "database": "test",
            "collection": "source",
            "poll.max.batch.size": 1000,
            "poll.await.time.ms": 5000,
            "heartbeat.interval.ms": 3000,
            "offset.partition.name": "mongo-source.2",
            "startup.mode": "copy_existing",
            "publish.full.document.only": true,
            "key.ignore": true,
            "value.converter": "org.apache.kafka.connect.json.JsonConverter",
            "value.converter.schemas.enable": false
        }
    }'