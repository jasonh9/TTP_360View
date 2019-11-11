const app = require('express')()
const server = require('http').createServer(app)
const io = require('socket.io')(server)
// const util = require('util')
// const lodash = require('lodash')

const registerDevice = require('./controllers/register-device')

io.on('connection', (socket) => {
  // register user
  socket.on('register', (UUID) => {
    console.log('User is requesting to register : ', UUID)
    registerDevice(socket, UUID)
  })

  // process data
})

server.listen(3001)
