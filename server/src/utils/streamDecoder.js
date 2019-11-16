// base64 decoder utility and integrity check
const crypto = require('crypto')

function decodeBase64 (stream) {
  let validator = new RegExp('^(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)$')
  // check if the stream is valid
  // if the stream contains characters other than alpah numeric the stream is not valid
  if (validator.test(stream)) {
    return {
      'message': Buffer.from(stream, 'base64').toString('ascii'), 'integrityHash': crypto.createHash('md5').update(stream).digest('hex')
    }
  } else {
    console.error('invalid stream received')
    return {
      'message': 'invalid', 'integrityHash': 'invalid'
    }
  }
}

module.exports = {
  decodeBase64: decodeBase64
}
