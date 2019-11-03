import React from 'react';
import SideNav from './components/sideNav';
import SensorModule from './components/sensorModule';
import './App.css';
import {getConnectionStatus, emitToSocket, subToDevices, getAllActiveUsers} from './utils/socketAPI';
class App extends React.Component{
  constructor(){
    super()
    this.state = {
      data : null
    }
  }

  componentDidMount(){
    getConnectionStatus()
  }

  sendData = () => {
    emitToSocket('test','test123')
  }

  render(){
    return (
      <div className="App">
          <SideNav />
          <SensorModule />
      </div>
    );
  }
}

export default App;
