# 09-java-rabbitmq-helloworld

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

## Helloworld
                    message
 ----------        ---------        ----------
| Producer | ---> | | | | | | ---> | Consumer |
 ----------        ---------        ----------

 ## Add RabbitMQ Java client library using Maven
 - Right click on project folder
 - Click 'Add Framework Support...'
 - Select Maven
 - Add dependencies
 ```
 <dependency>
     <groupId>com.rabbitmq</groupId>
     <artifactId>amqp-client</artifactId>
     <version>3.6.2</version>
 </dependency>
 ```
 - And import dependency

 ## Create Java class and add code
 ```
 com.hawkup.rabbitmq.Send
 com.hawkup.rabbitmq.Recv
 ```

 ## Run Send.java and Recv.java