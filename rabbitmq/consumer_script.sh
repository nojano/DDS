#! /bin/bash
#build the consumer container

# Info
# USAGE: consumer_script.sh -topic -n_consumer

docker build -t rabbitmq_consumer:1.0 ./Consumer

export topic=$1
for j in `seq 1 $2`;
    do
    docker run -d --name "Rconsumer_$1_$j" --network host -e topic rabbitmq_consumer:1.0
    echo "Consumer number $j running and listening on topic $1"
done