## Purpose
This is terraform module which connects to kafka started with docker compose and create 10 topics with random number of partitions
### Way to check
Clone this repo to your folder and run this command one after the other :
```bash
docker compose up -d
terraform init
terraform plan
terraform apply
```
Now you can check list of topics using
```bash
docker exec broker kafka-topics --bootstrap-server broker:9092 --list
```
Make sure there no changes using
```bash
terraform plan
```
[kafka commands](https://developer.confluent.io/quickstart/kafka-docker/)
