resource "random_integer" "partitions" {
  count = var.num_topics
  min = 1
  max = 10
}

resource "null_resource" "create_topics" {
  count = var.num_topics
  connection {
    host = "localhost"
    type = "docker"
  }
  provisioner "local-exec" {
    command = <<EOF
    docker exec ${var.kafka_container_name} kafka-topics
    --bootstrap-server ${var.kafka_container_name}:9092 --create
    --topic ${var.topic_prefix}${count.index} --partitions
    ${random_integer.partitions[count.index].result}
  EOF
  }
}
