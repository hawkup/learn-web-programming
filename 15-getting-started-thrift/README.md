# 15-getting-started-thrift

## Install Thrift
But we will use Docker
```
Download Thrift https://thrift.apache.org/download
tar -xvf <thrift tar file>
cd <thrift directory>
./configure && make
```

## Running on Docker (Ubuntu 16.04)
```
docker-compose build
docker-compose run thrift
```

## Create hello.thrift
```
touch hello.thrift
```

## Declare service name 'HelloService' and function name 'hello' that return string
```
service HelloService {
  string hello()
}
```

## Writing a .thrift file
you need to create a thrift file. This file is an interface definition made up of thrift types and Services.
To generate the source from a thrift file run
```
thrift --gen <language> <Thrift filename>
```
Generate for python
```
thrift --gen py hello.thrift
```
This command will create gen-py directory

## Create python_server.py

## Create python_client.py

## Run python_server.py
```
root@xxx:/# cd program
root@xxx:/# python python_server.py
```

## Run python_client.py
open new terminal
```
# get running container id
docker ps
# run /bin/bash in running container
docker exec -ti <container-id> /bin/bash
# run python_client.py
root@xxx:/# cd program
root@xxx:/# python python_client.py
Hello from server
```

## Create node client
- Generate thrift for nodejs
```
thrift --gen js:node hello.thrift
```

## Install thrift module
```
cd program
npm install --save thrift
```

## Create node_client.js and Add Code
```
cd program
touch node_client.js
```

## Run node_client.js
```
nodejs node_client.js
```
