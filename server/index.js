const app = require('express')();
const server = require('http').createServer(app);
const io = require('socket.io')(server);
const util = require('util');
const lodash = require('lodash');

const execFile = util.promisify(require('child_process').execFile);

const startRedis = async () => {
  const { stdout } = await execFile('../third_party/redis-stable/src/redis-server');
  console.log(stdout);
}

startRedis();

// Redis Client

const redis = require('redis');

const RedisClient = redis.createClient({host : 'localhost', port : 6379})

RedisClient.on('ready',function() {
 console.log("Redis is ready");
});

RedisClient.on('error',function() {
    console.log("Error in Redis");
});

// RedisClient.on('message', (channel, message)=> {
//     console.log(`Message : ${message} on Channel ${channel}`);
// })

// RedisClient.subscribe('digitalComb')

// declare obj messages to send to clients
const response = {
    connected : { response : 'registered'},
    duplicate : { response : 'already_registered'},
    validData : { response : 'received_data'}
}

const sensorType = {
    LTE : 'LTE',
    BLE : 'BLE',
    NFC : 'NFC',
    HRD_ENC : 'HRD_ENC',
    VPN : 'VPN',
    WIFI : 'WIFI',
    GPS : 'GPS',
    AV : 'AV',
    MDM : 'MDM'
}

io.on('connection', (socket) => {
    console.log(`client connected with id: ${socket.id}`)

    // ack response back to the client upon successful data collection
    const sendValidResponse = (UUID) => {
        socket.emit(UUID, response.validData);
    }

    // reject the registration and send a message
    const rejectRegistration = (UUID) => {
        socket.emit(UUID, response.duplicate)
        console.log(`Device ${UUID} rejected registratio because of duplication`)
    }

    // accept the user registration
    const acceptRegistration = (UUID) => {
        RedisClient.RPUSH('RegisteredDevices', UUID, (err, reply)=> {
            socket.emit(UUID, response.connected)
            console.log(`Device ${UUID} registered at position ${reply}`)
            err ? console.error(err) : false
        });
    }

    // register the user using UUID
    socket.on('register', (UUID) => {
        console.log('User is requesting to register : ', UUID)
        // check to see if the user exists
        RedisClient.LRANGE('RegisteredDevices', 0, -1, (err, reply) => {
            reply.indexOf(UUID) === -1 ? acceptRegistration(UUID) : rejectRegistration(UUID);
        })
    })

    // get data from user and load it in a hashmap
    socket.on('clientData' , (payload) => {
        // create a category seperation
        // LTE, BLE, NFC, HRD_ENC, VPN, WIFI, GPS, AV, MDM
        // console.log('payload = ', payload, 'and type is ', typeof(payload))

        const processData = () => {
            sendValidResponse(payload.UUID);

            Object.keys(payload).forEach((keys) => {
                console.log(keys)
            })
            
            Object.keys(payload.LTE).forEach( (keys) => {
                RedisClient.HSET(payload.UUID, `LTE.${keys}`, `${payload.LTE[keys]}`)
            })
        }

        typeof(payload) === 'object' && payload.UUID ? processData() : console.log('error getting data');
    })

});

server.listen(3001);