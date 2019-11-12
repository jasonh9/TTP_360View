'use strict'

const helper = require('./helper')
const deviceModel = require('../models/device')

// provide some CRUD functions, just get and insert at the moment
module.exports = {
  get: function (identifer) {
    return helper.connectToDatabase()
      .then((db) => db.collection('devices'))
      .then((col) => col.findOne({
        _id: identifer
      }))
  },
  insert: function (device) {
    return helper.connectToDatabase()
      .then((db) => helper.getNextIncrementationValueForCollection(db, 'devices'))
      .then((newId) => {
        return helper.connectToDatabase()
          .then((db2) => db2.collection('devices'))
          .then((col) => {
            let valid = false
            device._id = newId
            try {
              valid = deviceModel(device)
              if (!valid) {
                return deviceModel.errors
              }
              return col.insertOne(device)
            } catch (e) {
              console.log('validation failed', e)
            }
            return null
          }) // id is created and concat automagically
      })
  }
}
