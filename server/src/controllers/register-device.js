// register the user and send a response back to the requestor
const respondToUser = require('../lib/websocket-respond')
const { decodeBase64 } = require('../utils/streamDecoder')
const deviceDB = require('../db/deviceDB')
const { co } = require('../utils/common')

module.exports = {
  registerDevice: async function (socket, uuid) {
    try {
      respondToUser(socket, decodeBase64(uuid))
      // console.log(uuid)
    } catch (err) {
      console.log(err)
    }
  },
  inputDeviceData: async function (uuid, payload) {
    // console.log(uuid, 'from register device.js')
    try {
      let inserted = await deviceDB.insert(uuid)
      if (co.isEmpty(inserted.ops[0])) {
        throw inserted
      } else {
        return co.rewriteId(inserted.ops[0])
      }
    } catch (err) {
      console.log('error trying to input device data', err)
      return ('bad status')
    }
  },
  getDeviceData: async function (id) {
    try {
      let device = await deviceDB.get(null, id)
      // console.log(device)
      // if (co.isEmpty(device)) {
      //   console.log('device data is empty')
      // } else {
      //   console.log(device)
      // }
      return device
    } catch (err) {
      console.log(err)
    }
  }
}
