'use strict'

/*
device model with ajv (json format) validation
*/

let Ajv = require('ajv')
let ajv = Ajv({
  verbose: true
})

// the device schema
const device = {
  type: 'object',
  properties: {
    _id: {
      type: 'number'
    },
    uuid: {
      type: 'string'
    }
    // gps location data
    // ble
  }
}

module.exports = ajv.compile(device)
