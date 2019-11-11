# Tech to protect 360 view dashboard (Contest 001)
This project will consist of 3 main components, a server receive and send communications throught a real time websocket protocol. The web dashboard will act as a command center to allow for dispatch to get device healths of on-the-ground emergency responders. The payload from the OTGER(on-the-ground emergency responders) devices will be sent via OTA(over the air) through encrypted cellular networks.

# Features
## Real time
This system utilizes a real time protocol, that means that the communication between the client and server is open and the flow of data is bi-directional.

## Data transport and integrity
Every time a payload is received, the server will respond with a status and an integrity hash of the received payload.

# Usage
### Registration

request
```javascript
emit('register','Mjk3YjQyYTktOWUzMS00M2RiLWI0MzYtZjdiNjFhNTU2ODhh')
```

response sent to the event `UUID`
```javascript
{
  "response":"OK",
  "integrity":"62ea32222e497f2adb5e35892e3e0fb9"
}
```
make sure you use the integrity hash to check your payload! this will let the application know if the payload is unmodified or sent successfully without interruptions.
# Components
* Server
* Mobile Client
* Web Dashboard

# Pre-req
The project is using redis to manage the data structure, check the integrity of the service by intantiating a `make test` within the directory `third-party/redis-stable/`


# Resources
https://www.techtoprotectchallenge.org/contest/contest-001/
https://paper.dropbox.com/doc/OFFICIAL-CONTEST-RESOURCES-CONTEST-001-xq5HsQ6czRerPPwA8Rknd
