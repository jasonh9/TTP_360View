'use strict'

const helper = require('./helper')
const deviceModel = require('../models/device')

// provide some CRUD functions, just get and insert at the moment
module.exports = {
  get: function (dbconn, identifer) {
    return helper.getCollectionObj(dbconn, 'device').then((col) => {
      return col.find({ uuid: identifer.toString() })
    })
    // return helper.connectToDatabase().then((db) => db.collection('device').find({ uuid: identifer.toString() }))
    // return helper.connectToDatabase()
    //   .then((db) => db.collection('device'))
    //   .then((col) => col.find({
    //     _id: identifer
    //   }))
  },
  insert: function (device) {
    return helper.connectToDatabase()
      .then((db) => helper.getNextIncrementationValueForCollection(db, 'device'))
      .then((newId) => {
        return helper.connectToDatabase()
          .then((db2) => db2.collection('device'))
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
