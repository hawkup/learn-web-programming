# 13-java-rabbitmq-topics

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

## Topic exchange
Messages send to a 'topic' exchange can't have an arbitrary 'routing key'. It must be a list of words, delimited by dots.
- * (star) can substitute for exactly one word.
- # (hash) can substitute for zero or more words.


Example: routing key consists of three words "<speed>.<colour>.<species>"

                    type=topic               message
 ----------        ----------  *.orange.*   ---------        ----------
| Producer | ---> | Exchange | ----------> | | | | | | ---> | Consumer |
 ----------        ----------               ---------        ----------
                        |  |  *.*.rabbit
                        |  |------------->  ---------        ----------
                        |----------------> | | | | | | ---> | Consumer |
                            lazy.#          ---------        ----------

## Run ReceiveLogsTopic with "#" argument

## Run ReceiveLogsTopic with "kern.*" argument

## Run ReceiveLogsTopic with "*.critical" argument

## Run ReceiveLogsTopic with "kern.*" "*.critical" argument

## Run EmitLogTopic with 'routing key' and 'message'
```
EmitLogTopic "kern.critical" "A critical kernel error"
```