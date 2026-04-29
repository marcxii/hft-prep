Lab 5: Transactional Messaging Durability (RabbitMQ Quorum Queues)

The Setup: Deploy a 3-node RabbitMQ cluster. Declare a new queue and explicitly set the x-queue-type argument to quorum.  

The Drill: Publish a batch of persistent messages to the quorum queue. While the messages are resting in the queue, abruptly shut down or kill the RabbitMQ service on the node currently acting as the queue leader. Verify via the RabbitMQ management UI or CLI that the two remaining nodes maintain their quorum, elect a new leader, and that absolutely zero messages were lost.