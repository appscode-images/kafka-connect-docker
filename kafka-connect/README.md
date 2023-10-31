# kafka-connect

`MongoDB source connector using curl`
```
curl -X POST http://localhost:8083/connectors -H 'Content-Type: application/json' -d '{
        "name": "mongo-source",
        "config": {
            "connector.class": "com.mongodb.kafka.connect.MongoSourceConnector",
            "tasks.max": 1,
            "connection.uri": "mongodb://root:Y7UQamKkFosjkjdy@mgo-rs-pods.demo.svc.cluster.local:27017",
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