var resMessages = {
  'error': 'ERROR',
  'dupDevice': 'DEVICE EXISTS',
  'success': 'OK'
}

module.exports = function respondToUser (socket, uuid) {
  console.log(`successfully registered ${uuid.message} with integrity hash of ${uuid.integrityHash}`)
  const payload = {
    response: resMessages.success,
    integrity: uuid.integrityHash
  }
  socket.emit(uuid.message, payload)
}
