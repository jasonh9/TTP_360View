// Redis server management, make sure the server is up and running, if there is an interrupt gracefully shut down the redis server
const RedisServer = require('redis-server');

const server = new RedisServer({
    port: 6379,
    bin: '../../third_party/redis-stable/src/redis-server'
});

function start(){
    server.open((err) => {
        err === null ? console.log('redis server up and running') : console.log(err)
    });
}


process.on('SIGINT', function() {
    console.log("Caught interrupt signal");
    server.close((err) => {
        console.log('Graceful shutdown of redis ...');
    })
});

module.exports = {start}