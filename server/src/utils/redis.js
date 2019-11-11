// Redis server management, make sure the server is up and running, if there is an interrupt gracefully shut down the redis server
const RedisServer = require('redis-server')

const server = new RedisServer({
  port: 6379,
  bin: '../../third_party/redis-stable/src/redis-server'
})

server.open().then((err) => {
  // You may now connect a client to the Redis server bound to `server.port`.
  err === null ? console.log('redis server up and running in promise') : console.log(err)
})

server.on('stdout', (msg) => {
  console.log(msg)
})

process.on('SIGINT', function () {
  console.log('Caught interrupt signal')
  server.close((_err) => {
    console.log('Graceful shutdown of redis ...')
  })
})
