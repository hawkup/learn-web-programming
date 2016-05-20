# 12-java-rabbitmq-routing

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

## Bindings
Bindings can take 'routing key' parameter (name on EmitLog, if on ReceiveLogs call 'binding key'). 
```
// black is binding key
channel.queueBind(queueName, EXCHANGE_NAME, "black");
```
But if the exchange's type is 'fanout' this parameter will be ignored.


## Direct exchange

                    type=direct         message
 ----------        ----------  orange  ---------        ----------
| Producer | ---> | Exchange | -----> | | | | | | ---> | Consumer |
 ----------        ----------          ---------        ----------
                        |  |  black
                        |  |-------->  ---------        ----------
                        |-----------> | | | | | | ---> | Consumer |
                            green      ---------        ----------
                            
## Multiple bindings
                    type=direct         message
 ----------        ----------  orange  ---------        ----------
| Producer | ---> | Exchange | -----> | | | | | | ---> | Consumer |
 ----------        ----------          ---------        ----------
                        |              ---------        ----------
                        |-----------> | | | | | | ---> | Consumer |
                            orange     ---------        ----------

## Emitting Logs
We change exchange's type to 'direct'
```
channel.exchangeDeclare(EXCHANGE_NAME, "direct");
```
We will supply the log severity as a 'routing key'
```
channel.basicPublish(EXCHANGE_NAME, severity, null, message.getBytes());
```

## Subscribing
We're going to create a new binding for each severity
```
String queueName = channel.queueDeclare().getQueue();

for(String severity : argv){    
  channel.queueBind(queueName, EXCHANGE_NAME, severity);
}
```

                    type=direct         message
 ----------        ----------  error  ---------        ----------
| Producer | ---> | Exchange | -----> | | | | | | ---> | Consumer |
 ----------        ----------          ---------        ----------
                     |  |  |  info
                     |  |  |-------->  ---------        ----------
                     |  |-----------> | | | | | | ---> | Consumer |
                     |     error       ---------        ----------
                     |-------------->
                          warning
                          
## Run ReceiveLogsDirect with waring error arguments

## Run ReceiveLogsDirect with info warning error arguments

## Run EmitLogDirect with severity and message arguments
```
EmitLogDirect error "This is a error message"
```