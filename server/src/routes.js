const { registerDevice, inputDeviceData, getDeviceData } = require('./controllers/register-device')

function connectWSS (io, server) {
  io.on('connection', (socket) => {
    // register user
    socket.on('register', (UUID) => {
      console.log('User is requesting to register : ', UUID)
      registerDevice(socket, UUID)
      inputDeviceData(UUID, null)
    })
    socket.on('getData', (id) => {
      // inputDeviceData(id, null)
      getDeviceData(id).then((data) => {
        data.forEach(function (doc) {
          console.log(doc)
        })
      })
    })
  })
  server.listen(3001)
}
module.exports = {
  connectWSS
}
