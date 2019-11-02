const app = require('express')();
const server = require('http').createServer(app);
const io = require('socket.io')(server);

io.on('connection', () => {
    console.log('client connected')
});

server.listen(3001);
