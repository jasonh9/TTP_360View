// register the user and send a response back to the requestor
const respondToUser = require('../lib/websocket-respond')
const { decodeBase64 } = require('../utils/streamDecoder')

module.exports = function registerDevice (socket, uuid) {
  respondToUser(socket, decodeBase64(uuid))
  console.log(uuid)
}
