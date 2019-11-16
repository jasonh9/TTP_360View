'use strict'

const helper = require('./helper')

// this function should include commands that create indexes (if any)
// for any collections that the service may be using

// it should always return a promise
module.exports = function createIndexes () {
  // SAMPLE CODE
  return helper.getCollection('devices').then((decks) => {
    return decks.createIndexes([
      { key: { 'revisions.contentItems.ref.id': 1 } },
      { key: { 'revisions.contentItems.ref.revision': 1 } },
      { key: { 'revisions.contentItems.kind': 1 } }
    ])
  })
}
