const app = require('express')()
const server = require('http').createServer(app)
const io = require('socket.io')(server)
// const util = require('util')
// const lodash = require('lodash')

const createIndexes = require('./db/createIndexes')

// const Db = require('mongodb').Db,
//   Server = require('mongodb').Server,
//   MongoClient = require('mongodb').MongoClient

async function init () {
  try {
    // await createIndexes()
  } catch (err) {
    console.warn('error creating the indexes on the database collection:')
    console.warn(err.message)
  }
  require('./routes').connectWSS(io, server)
}

init()
