# 10-java-rabbitmq-work-queues

## Installation RabbitMQ
```
# with brew
brew update
brew install rabbitmq
```

## Start RabbitMQ
```
/usr/local/sbin/rabbitmq-server
# RabbitMQ runing on localhost on standard port (5672)
```

## Work Queues
                    message
 ----------        ---------        ----------
| Producer | ---> | | | | | | ---> | Consumer |
 ----------        ---------        ----------
                       |            ----------
                       |---------> | Consumer |
                                    ----------

## Round-robin dispatching
- Change Send.java to NewTask.java
- Modify NewTask.java to get string from argv command line
- Change Recv.java to Worker.java
- Modify Worker.java to sleep when message from queue has "."
- Run Worker.java 2 process
- Run NewTask.java with argv to test Round-robin

## Message acknowledgment
RabbitMQ will not remove message until receive ack from work that work done.
- Turn on acknowledment by change to autoAck=false
```
channel.basicConsume(QUEUE_NAME, false, consumer);
```
- And send a proper acknowledgment from work when doWork finish
```
channel.basicAck(envelope.getDeliveryTag(), false);
```
- Run Worker.java 2 process
- Run NewTask.java with argv
- Try to kill Worker.java process while work's not finish
- Debug message that still in queue
```
 /usr/local/sbin/rabbitmqctl list_queues name messages_ready messages_unacknowledged
```

## Message durability
Set RabbitMQ mark messages as persistent for protect lost data when RabbitMQ server crashes.
- Defined new queue (Worker, Newtask) because RabbitMQ doesn't allow you to redefine an existing queue with different parameters and set durable=true
```
private final static String QUEUE_NAME = "task_queue";
boolean durable = true;
channel.queueDeclare(QUEUE_NAME, durable, false, false, null);
```
- Mark message as persistent (NewTask.java)
```
channel.basicPublish("", QUEUE_NAME, MessageProperties.PERSISTENT_TEXT_PLAIN, message.getBytes());
```

## Fair dispatch
- Tell RabbitMQ not to give more than one message to a worker at time (Worker.java)
```
int prefetchCount = 1;
channel.basicQos(prefetchCount);
```