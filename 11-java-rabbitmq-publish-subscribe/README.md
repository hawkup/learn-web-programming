# 11-java-rabbitmq-publish-subscribe

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

## Publish/Subscribe
Example, The logging system run one receiver program for write the logs to disk and run another receiver to show on screen

## Exchanges
The core idea in the messaging model in RabbitMQ is that the producer never sends any messages directly to queue.
Actually, quite often the producer doesn't even know if a message will be delivered to any queue at all.

Instead, the producer can only send messages to an exchange.

                                      message
 ----------        ----------        ---------        ----------
| Producer | ---> | Exchange | ---> | | | | | | ---> | Consumer |
 ----------        ----------        ---------        ----------
                        |            ---------        ----------
                        |---------> | | | | | | ---> | Consumer |
                                     ---------        ----------
                                     
- Exchange's type
direct, topic, headers and fanout

- Declare exchange
The first parameter is a name of exchange. The second is a type of exchange.
```
channel.exchangeDeclare("logs", "fanout");
```

- Listing exchanges
```
/usr/local/sbin/rabbitmqctl list_exchanges
```

- Nameless exchanges
```
channel.basicPublish("", "hello", null, message.getBytes());
```
The first parameter is the name of the exchange. If it's empty string, we were using default exchange.

- Temporary queues
The logging system, we're interested only in currently flowing messages. So we need two things.
Firstly, we need fresh, empty queue. To do this we could create a queue with random name.
Secondly, once we disconnect the consumer the queue should be automatically deleted.
```
String queueName = channel.queueDeclare().getQueue();
// this will a non-durable, exclusive, autodelete queue with a generated name
```

- Bindings
We need to bind exchange with queue
```
channel.queueBind(queueName, "logs", "");
```

- Listing bindings
```
/usr/local/sbin/rabbitmqctl list_bindings
```

## Change NewTask.java to EmitLog.java
- Declare exchange
```
private static final String EXCHANGE_NAME = "logs";
channel.exchangeDeclare(EXCHANGE_NAME, "fanout");
```
 
## Change Worker.java to ReceiveLogs.java
- Declare exchange
```
private static final String EXCHANGE_NAME = "logs";
channel.exchangeDeclare(EXCHANGE_NAME, "fanout");
```
- Create Temporary queue and binding
```
String queueName = channel.queueDeclare().getQueue();
channel.queueBind(queueName, EXCHANGE_NAME, "");
```

## Run 2 process on ReceiveLogs.java and Run EmitLog.java
It should display data both process