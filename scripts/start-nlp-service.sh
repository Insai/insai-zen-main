#!/usr/bin/env bash

echo "Starting NLP Server..."
# Start Docker containers
## MongoDB Container
echo "MongoDB:"
docker run --name zen-mongo -p 27017:27017 -d mongo

## Redis Container
echo "Reddis: "
docker run --name zen-redis -p 6379:6379 -d redis

## RabbitMQ Container – with management plugin
echo "Celery – RabbitMQ:"
docker run -d --name zen-rabbit -p 8080:15672 -p 5672:5672 rabbitmq:3-management

# NLP Server
echo "Starting Flask Server"
cd nlp-service && python app.py
