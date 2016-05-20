var thrift = require('thrift');
var Hello = require('./gen-nodejs/HelloService');
var ttypes = require('./gen-nodejs/hello_types');

transport = thrift.TBufferedTransport();
protocol = thrift.TBinaryProtocol();

var connection = thrift.createConnection('localhost', 9090, {
  transport: transport,
  protocol: protocol
});

connection.on('error', function(err) {
  console.log(err);
});

// Create a Hello Client with the connection
var client = thrift.createClient(Hello, connection);

client.hello(function(err, response) {
  console.log(response);
  connection.end();
});
