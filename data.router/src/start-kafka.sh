#!/bin/bash

#http://kafka.apache.org/documentation.html
#Step 1: Download the code
sudo apt-get install default-jre

wget http://mirror.cogentco.com/pub/apache/kafka/0.8.1.1/kafka_2.9.2-0.8.1.1.tgz

tar xvzf kafka_2.9.2-0.8.1.1.tgz

#Step 2: Start the server
./kafka_2.9.2-0.8.1.1/bin/zookeeper-server-start.sh ./kafka_2.9.2-0.8.1.1/config/zookeeper.properties &> /dev/null &
echo zookeeper started
sleep 10
./kafka_2.9.2-0.8.1.1/bin/kafka-server-start.sh ./kafka_2.9.2-0.8.1.1/config/server.properties &> /dev/null &
echo kafka started

#Step 3: Create a topic
./kafka_2.9.2-0.8.1.1/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic forex
./kafka_2.9.2-0.8.1.1/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic forexJ
./kafka_2.9.2-0.8.1.1/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic rules

echo topics:
./kafka_2.9.2-0.8.1.1/bin/kafka-topics.sh --list --zookeeper localhost:2181
