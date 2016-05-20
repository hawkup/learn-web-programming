# 14-java-rabbitmq-rpc

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

## Remote procedure call (RPC)
If we need to run a function on a remote computer and wait for the result. This pattern is commonly known as RPC

## Client interface
It's going to expose a method named 'call' which sends an RPC request and blocks until the answer is received
```
FibonacciRpcClient fibonacciRpc = new FibonacciRpcClient();
String result = fibonacciRpc.call("4");
System.out.println("fib(4) is " + result);
```

## Callback queue
A client sends a request message and a server replies with a response message. In order to receive a response we need to send a 'callback' queue address with the request.
```
callbackQueueName = channel.queueDeclare().getQueue();

BasicProperties props = new BasicProperties
                            .Builder()
                            .replyTo(callbackQueueName)
                            .build();
// nameless exchange, routing key, props (callbackQueueName), message response
channel.basicPublish("", "rpc_queue", props, message.getBytes());
```

## Correlation Id
In the method presented above we suggest creating a callback queue for every RPC request. That's pretty inefficient.
Let's create a single callback queue per client not per request.
That's when the 'correlationId' property is used. We're going to set it to a unique value for every request.

## Summary
                     -----------------------------             --------------------
       -----------> | Request reply_to=amqp.gen-X |---------->|     rpc_queue      |----------
      |             | correlation_id=abc          |           |                    |          |
      |              -----------------------------             --------------------           |
 ----------                                                                              -------------
| Consumer |                                                                            |   Server    |
 ----------                                                                              -------------
      |              -----------------------------             --------------------           |
      |             | Reply                       |           |reply_to=amqp.gen-X |          |
       -----------> | correlation_id=abc          |<----------|                    |-----------
                     -----------------------------             --------------------
## Run RpcServer.java
## Run RpcClient.java





