import io from 'socket.io-client';
import {addSensorState, allUsers} from '../redux/actions/index';
import store from '../redux/store/index';

window.store = store;
window.addSensorState = addSensorState;

const socket = io.connect('http://192.168.43.30:3001');

const getConnectionStatus = () => {
    socket.on('connect', () => console.log(socket.id !== 'undefined' ? `WebSocket Connected with id ${socket.id}` : `WebSocket unable to connect`));
}

const emitToSocket = (event, message) => {
    socket.emit(event, message);
}

const subToDevices = (UUID) => {
    // let the server know that this is an init connection
    socket.emit('getDATA', UUID)
    socket.on(UUID, (data) => {store.dispatch( addSensorState({ uuid : UUID, payload : data}))})
    // socket.on('297b42a9-9e31-43db-b436-f7b61a55688a', (data) => {store.dispatch( addSensorState({ uuid : '297b42a9-9e31-43db-b436-f7b61a55688a', payload : data}))})
}

const getAllActiveUsers = () => {
    socket.emit('requestAllRegisteredUsers', 'giveme');
    socket.on('responseAllRegisteredUsers', (data) => {
        store.dispatch( allUsers({ uuid : data}))
    })
}
export {getConnectionStatus, emitToSocket, subToDevices, getAllActiveUsers}