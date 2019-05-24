var http = require('http');
var handleRequest = function(request, response) {
    console.log("received connection request: " + request.connection.remoteAddress);
    response.writeHead(200);
    response.end("Hello NEW World!");
}
var www = http.createServer(handleRequest);
www.listen(5000);
